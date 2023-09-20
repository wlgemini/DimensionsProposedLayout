import SwiftUI


public enum HorizontalAlignmentProposal {
    
    /// constant: center alignment offset
    case center(_ constant: CGFloat = 0)
    
    /// constant: leading alignment offset
    case leading(_ constant: CGFloat = 0)
    
    /// constant: trailing alignment offset
    case trailing(_ constant: CGFloat = 0)
}

public enum VerticalAlignmentProposal {
    
    /// constant: center alignment offset
    case center(_ constant: CGFloat = 0)
    
    /// constant: top alignment offset
    case top(_ constant: CGFloat = 0)
    
    /// constant: bottom alignment offset
    case bottom(_ constant: CGFloat = 0)
}
