//
//  AutoConstraint.swift
//  AutoConstraint
//
//  Created by Dayo Banjo on 5/2/23.
//

#if os(iOS) || os(tvOS)
import UIKit
#else
import AppKit
#endif

public struct AnchoredConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}

#if os(iOS) || os(tvOS)
public extension UIView {
    
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?, 
                leading: NSLayoutXAxisAnchor?,
                bottom: NSLayoutYAxisAnchor?,
                trailing: NSLayoutXAxisAnchor?, 
                padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach{ $0?.isActive = true }
        
        return anchoredConstraints
    }
    
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    func fillSuperviewInSafeArea(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.safeAreaLayoutGuide.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.safeAreaLayoutGuide.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.safeAreaLayoutGuide.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.safeAreaLayoutGuide.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    
    func centerInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func centerInSuperview(size: CGSize = .zero, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor, constant: padding.left).isActive = true
        }
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func reSize(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func centerX(to constrainable: UIView, padding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: constrainable.centerXAnchor, constant: padding).isActive = true
    }
    
    func centerY(to constrainable: UIView, padding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: constrainable.centerYAnchor, constant: padding).isActive = true
    }
    
    func leadingToLeading(of constrainable: UIView, padding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: constrainable.leadingAnchor, constant: padding).isActive = true
    }
    
    func leadingToTrailing(of constrainable: UIView, padding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: constrainable.trailingAnchor, constant: padding).isActive = true
    }
    
    func topToBottom(of constrainable: UIView, padding: CGFloat = 0, useSafeArea: Bool = false) {
        translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: useSafeArea ? constrainable.safeAreaLayoutGuide.bottomAnchor
                                  : constrainable.bottomAnchor, 
                                  constant: padding).isActive = true
    }
    
    func topToTop(of constrainable: UIView,
                  padding: CGFloat = 0,
                  useSafeArea: Bool = false) {
        translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: useSafeArea ? constrainable.safeAreaLayoutGuide.topAnchor
                                  : constrainable.topAnchor, 
                                  constant: padding).isActive = true
    }
    
    func bottomToBottom(of constrainable: UIView, 
                        padding: CGFloat = 0, 
                        useSafeArea: Bool = false) {
        translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: useSafeArea ? constrainable.safeAreaLayoutGuide.bottomAnchor
                                     : constrainable.bottomAnchor, 
                                     constant: padding).isActive = true
    }
    
    func bottomToTop(of constrainable: UIView,
                     padding: CGFloat = 0,
                     useSafeArea: Bool = false) {
        translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: useSafeArea ? constrainable.safeAreaLayoutGuide.topAnchor
                                     : constrainable.topAnchor , 
                                     constant: padding).isActive = true
    }
    
    func height(of height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func height(to constrainable: UIView,
                padding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalTo: constrainable.heightAnchor, constant: padding).isActive = true
    }
    
    func width(of width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
}
#endif

#if os(macOS)

public extension NSEdgeInsets {
    static let zero = NSEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
}

public extension NSView {
    
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?, 
                leading: NSLayoutXAxisAnchor?,
                bottom: NSLayoutYAxisAnchor?,
                trailing: NSLayoutXAxisAnchor?, 
                padding: NSEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0),
                size: CGSize = .zero) -> AnchoredConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach{ $0?.isActive = true }
        
        return anchoredConstraints
    }
    
    func fillSuperview(padding: NSEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    func fillSuperviewInSafeArea(padding: NSEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.safeAreaLayoutGuide.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.safeAreaLayoutGuide.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.safeAreaLayoutGuide.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.safeAreaLayoutGuide.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    
    func centerInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func centerInSuperview(size: CGSize = .zero, padding: NSEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor, constant: padding.left).isActive = true
        }
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func reSize(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func centerX(to constrainable: NSView, padding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        self.centerXAnchor.constraint(equalTo: constrainable.centerXAnchor, constant: padding).isActive = true
    }
    
    func centerY(to constrainable: NSView, padding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        self.centerYAnchor.constraint(equalTo: constrainable.centerYAnchor, constant: padding).isActive = true
    }
    
    func leadingToLeading(of constrainable: NSView, padding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: constrainable.leadingAnchor, constant: padding).isActive = true
    }
    
    func leadingToTrailing(of constrainable: NSView, padding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: constrainable.trailingAnchor, constant: padding).isActive = true
    }
    
    func topToBottom(of constrainable: NSView, padding: CGFloat = 0, useSafeArea: Bool = false) {
        translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: useSafeArea ? constrainable.layoutMarginsGuide.bottomAnchor
                                  : constrainable.bottomAnchor, 
                                  constant: padding).isActive = true
    }
    
    func topToTop(of constrainable: NSView,
                  padding: CGFloat = 0,
                  useSafeArea: Bool = false) {
        translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: useSafeArea ? constrainable.layoutMarginsGuide.topAnchor
                                  : constrainable.topAnchor, 
                                  constant: padding).isActive = true
    }
    
    func bottomToBottom(of constrainable: NSView, 
                        padding: CGFloat = 0, 
                        useSafeArea: Bool = false) {
        translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: useSafeArea ? constrainable.layoutMarginsGuide.bottomAnchor
                                     : constrainable.bottomAnchor, 
                                     constant: padding).isActive = true
    }
    
    func bottomToTop(of constrainable: NSView,
                     padding: CGFloat = 0,
                     useSafeArea: Bool = false) {
        translatesAutoresizingMaskIntoConstraints = false
        self.bottomAnchor.constraint(equalTo: useSafeArea ? constrainable.layoutMarginsGuide.topAnchor
                                     : constrainable.topAnchor , 
                                     constant: padding).isActive = true
    }
    
    func height(of height: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func height(to constrainable: NSView,
                padding: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalTo: constrainable.heightAnchor, constant: padding).isActive = true
    }
    
    func width(of width: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
}
#endif
