# swift-geometry-boundary

Use this package when you have a two-dimensional `Geometry.Rectangle` and want one of its corners by name as a `Geometry.Point<2>`. Call `corner(_:)` with a `Boundary.Corner`. The rectangle is a `Geometry.Orthotope<2>` with a floating-point scalar, and it needs swift-geometry's `Affine` trait. For the corner and edge types themselves, use swift-boundary.

## Laws

- The y axis points up. `Boundary.Corner.bottomLeft` is the point `(llx, lly)` and `Boundary.Corner.topRight` is `(urx, ury)`. The two bottom corners use the lower y and the two top corners use the upper y.
