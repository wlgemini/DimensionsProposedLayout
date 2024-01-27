import SwiftUI


struct DimensionsProposedLayout: Layout {
    
    let width: WidthProposal
    let height: HeightProposal
    let horizontal: HorizontalAlignmentProposal
    let vertical: VerticalAlignmentProposal
    let anchor: UnitPoint
    
    init(width: WidthProposal = .sizeThatFits(),
         height: HeightProposal = .sizeThatFits(),
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
        let subviewSizeThatFits: CGSize = subviews[0].sizeThatFits(proposal)
        
        // width
        let width: Double
        switch self.width._proposal {
        case .proposed(let size):
            width = size
            
        case .sizeThatFits(let size):
            width = size(subviewSizeThatFits)
            
        case .container(let size):
            width = size(proposal)
        }
        
        // height
        let height: Double
        switch self.height._proposal {
        case .proposed(let size):
            height = size
            
        case .sizeThatFits(let size):
            height = size(subviewSizeThatFits)
            
        case .container(let size):
            height = size(proposal)
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
