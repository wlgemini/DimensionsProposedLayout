import SwiftUI


public struct DimensionsProposedLayout: Layout {
    
    let width: SizeProposal
    let height: SizeProposal
    let horizontal: HorizontalAlignmentProposal
    let vertical: VerticalAlignmentProposal
    let anchor: UnitPoint
    
    init(width: SizeProposal = .sizeThatFits(0),
         height: SizeProposal = .sizeThatFits(0),
         horizontal: HorizontalAlignmentProposal = .center(0),
         vertical: VerticalAlignmentProposal = .center(0),
         anchor: UnitPoint = .center) {
        self.width = width
        self.height = height
        self.horizontal = horizontal
        self.vertical = vertical
        self.anchor = anchor
    }
    
    public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        assert(subviews.count == 1)
        
        // sizeThatFits
        let subviewSize: CGSize = subviews[0].sizeThatFits(proposal)
        
        // width
        let width: Double
        switch self.width {
        case .container(let constant):
            width = (proposal.width ?? 0) + constant
            
        case .proposed(let constant):
            width = constant
            
        case .sizeThatFits(let constant):
            width = subviewSize.width + constant
        }
        
        // height
        let height: Double
        switch self.height {
        case .container(let constant):
            height = (proposal.height ?? 0) + constant
            
        case .proposed(let constant):
            height = constant
            
        case .sizeThatFits(let constant):
            height = subviewSize.height + constant
            
        }
        
        return CGSize(width: width, height: height)
    }
    
    public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
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
