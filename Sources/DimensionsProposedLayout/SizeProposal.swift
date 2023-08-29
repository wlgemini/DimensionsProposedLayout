import SwiftUI


public enum SizeProposal {
    
    /// constant: container size adjustment
    case container(_ constant: CGFloat)
    
    /// constant: proposed size
    case proposed(_ constant: CGFloat)
    
    /// constant: size that fits adjustment
    case sizeThatFits(_ constant: CGFloat)
}
