import SwiftUI


// MARK: - Designated
extension View {
    
    public func dimensionsProposed(width: WidthProposal = .sizeThatFits(),
                                   height: HeightProposal = .sizeThatFits(),
                                   horizontal: HorizontalAlignmentProposal = .center(),
                                   vertical: VerticalAlignmentProposal = .center(),
                                   anchor: UnitPoint = .center) -> some View {
        DimensionsProposedLayout(width: width, height: height, horizontal: horizontal, vertical: vertical, anchor: anchor) { self }
    }
}


// MARK: - Convenience
extension View {
    
    /// Add leading space to current view
    public func dimensionsProposed(leading spacing: CGFloat) -> some View {
        self.dimensionsProposed(width: .sizeThatFits(spacing, multiply: 1), horizontal: .leading(spacing), anchor: .leading)
    }
    
    /// Add trailing space to current view
    public func dimensionsProposed(trailing spacing: CGFloat) -> some View {
        self.dimensionsProposed(width: .sizeThatFits(spacing, multiply: 1), horizontal: .trailing(spacing), anchor: .trailing)
    }
    
    /// Add top space to current view
    public func dimensionsProposed(top spacing: CGFloat) -> some View {
        self.dimensionsProposed(height: .sizeThatFits(spacing, multiply: 1), vertical: .top(spacing), anchor: .top)
    }
    
    /// Add bottom space to current view
    public func dimensionsProposed(bottom spacing: CGFloat) -> some View {
        self.dimensionsProposed(height: .sizeThatFits(spacing, multiply: 1), vertical: .bottom(spacing), anchor: .bottom)
    }
}
