import SwiftUI


public protocol SizeProposal {
    static func proposed(_ size: CGFloat) -> Self
    static func sizeThatFits(_ size: @escaping (CGSize) -> CGFloat) -> Self
    static func container(_ size: @escaping (ProposedViewSize) -> CGFloat) -> Self
}

public struct WidthProposal: SizeProposal {
    
    // MARK: Proposed
    public static func proposed(_ size: CGFloat) -> Self {
        WidthProposal(.proposed(size))
    }
    
    // MARK: SizeThatFits
    public static func sizeThatFits(_ size: CGFloat = 0, multiply: CGFloat = 1) -> Self {
        WidthProposal(.sizeThatFits { size + multiply * $0.width })
    }
    
    public static func sizeThatFits(_ size: @escaping (CGSize) -> CGFloat) -> Self {
        WidthProposal(.sizeThatFits(size))
    }
    
    // MARK: - Container
    public static func container(_ size: CGFloat = 0, multiply: CGFloat = 1) -> Self {
        WidthProposal(.container { size + multiply * ($0.width ?? 0) })
    }
    
    public static func container(_ size: @escaping (ProposedViewSize) -> CGFloat) -> Self {
        WidthProposal(.container(size))
    }
    
    // MARK: - internal
    let _proposal: _SizeProposal
    
    init(_ proposal: _SizeProposal) {
        self._proposal = proposal
    }
}

public struct HeightProposal: SizeProposal {
    
    // MARK: Proposed
    public static func proposed(_ size: CGFloat) -> Self {
        HeightProposal(.proposed(size))
    }
    
    // MARK: SizeThatFits
    public static func sizeThatFits(_ size: CGFloat = 0, multiply: CGFloat = 1) -> Self {
        HeightProposal(.sizeThatFits { size + multiply * $0.height })
    }
    
    public static func sizeThatFits(_ size: @escaping (CGSize) -> CGFloat) -> Self {
        HeightProposal(.sizeThatFits(size))
    }
    
    // MARK: - Container
    public static func container(_ size: CGFloat = 0, multiply: CGFloat = 1) -> Self {
        HeightProposal(.container { size + multiply * ($0.height ?? 0) })
    }
    
    public static func container(_ size: @escaping (ProposedViewSize) -> CGFloat) -> Self {
        HeightProposal(.container(size))
    }
    
    // MARK: - internal
    let _proposal: _SizeProposal
    
    init(_ proposal: _SizeProposal) {
        self._proposal = proposal
    }
}

enum _SizeProposal {
    case proposed(CGFloat)
    case sizeThatFits((CGSize) -> CGFloat)
    case container((ProposedViewSize) -> CGFloat)
}
