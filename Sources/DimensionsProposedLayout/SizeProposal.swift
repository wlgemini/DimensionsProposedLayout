import SwiftUI


public struct SizeProposal {
    
    // MARK: - container
    public static func container(_ constant: CGFloat = 0) -> Self {
        SizeProposal(.container(constant, multiply: 1))
    }
    
    public static func container(multiply: CGFloat) -> Self {
        SizeProposal(.container(0, multiply: multiply))
    }
    
    public static func container(_ constant: CGFloat, multiply: CGFloat) -> Self {
        SizeProposal(.container(constant, multiply: multiply))
    }
    
    // MARK: - proposed
    public static func proposed(_ constant: CGFloat) -> Self {
        SizeProposal(.proposed(constant))
    }
    
    // MARK: - sizeThatFits
    public static func sizeThatFits(_ constant: CGFloat = 0) -> Self {
        SizeProposal(.sizeThatFits(constant, multiply: 1))
    }
    
    public static func sizeThatFits(multiply: CGFloat) -> Self {
        SizeProposal(.sizeThatFits(0, multiply: multiply))
    }
    
    public static func sizeThatFits(_ constant: CGFloat, multiply: CGFloat) -> Self {
        SizeProposal(.sizeThatFits(constant, multiply: multiply))
    }
    
    // MARK: - internal
    let _proposal: _SizeProposal
    
    init(_ proposal: _SizeProposal) {
        self._proposal = proposal
    }
}


enum _SizeProposal {
    
    /// constant: container size adjustment
    case container(_ constant: CGFloat, multiply: CGFloat)
    
    /// constant: proposed size
    case proposed(_ constant: CGFloat)
    
    /// constant: size that fits adjustment
    case sizeThatFits(_ constant: CGFloat, multiply: CGFloat)
}
