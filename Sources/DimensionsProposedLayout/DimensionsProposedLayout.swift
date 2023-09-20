import SwiftUI


struct DimensionsProposedLayout: Layout {
    
    let width: SizeProposal
    let height: SizeProposal
    let horizontal: HorizontalAlignmentProposal
    let vertical: VerticalAlignmentProposal
    let anchor: UnitPoint
    
    init(width: SizeProposal = .sizeThatFits(),
         height: SizeProposal = .sizeThatFits(),
         horizontal: HorizontalAlignmentProposal = .center(0),
         vertical: VerticalAlignmentProposal = .center(0),
         anchor: UnitPoint = .center) {
        self.width = width
        self.height = height
        self.horizontal = horizontal
        self.vertical = vertical
        self.anchor = anchor
    }
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        assert(subviews.count == 1)
        
        // sizeThatFits
        let subviewSize: CGSize = subviews[0].sizeThatFits(proposal)
        
        // width
        let width: Double
        switch self.width._proposal {
        case .container(let constant, let multiply):
            width = (proposal.width ?? 0) * multiply + constant
            
        case .proposed(let constant):
            width = constant
            
        case .sizeThatFits(let constant, let multiply):
            width = subviewSize.width * multiply + constant
        }
        
        // height
        let height: Double
        switch self.height._proposal {
        case .container(let constant, let multiply):
            height = (proposal.height ?? 0) * multiply + constant
            
        case .proposed(let constant):
            height = constant
            
        case .sizeThatFits(let constant, let multiply):
            height = subviewSize.height * multiply + constant
            
        }
        
        return CGSize(width: width, height: height)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        assert(subviews.count == 1)
        
        // x
        let x: CGFloat
        switch self.horizontal {
        case .center(let constant):
            x = bounds.midX + constant
            
        case .leading(let constant):
            x = bounds.minX + constant
            
        case .trailing(let constant):
            x = bounds.maxX + constant
        }
        
        // y
        let y: CGFloat
        switch self.vertical {
        case .center(let constant):
            y = bounds.midY + constant
            
        case .top(let constant):
            y = bounds.minY + constant
            
        case .bottom(let constant):
            y = bounds.maxY + constant
        }
        
        // place subview
        subviews[0].place(at: CGPoint(x: x, y: y), anchor: self.anchor, proposal: .init(bounds.size))
    }
}
