import SwiftUI


public enum HorizontalAlignmentProposal {
    
    /// constant: center alignment offset
    case center(_ constant: CGFloat)
    
    /// constant: leading alignment offset
    case leading(_ constant: CGFloat)
    
    /// constant: trailing alignment offset
    case trailing(_ constant: CGFloat)
}

public enum VerticalAlignmentProposal {
    
    /// constant: center alignment offset
    case center(_ constant: CGFloat)
    
    /// constant: top alignment offset
    case top(_ constant: CGFloat)
    
    /// constant: bottom alignment offset
    case bottom(_ constant: CGFloat)
}
