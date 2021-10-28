# Views and Communicating Actions

Experimentation with embedded views and communicating actions.

https://user-images.githubusercontent.com/1819208/139258343-13ed2674-e3f1-4d3b-b64f-330cad11ee7f.mp4

## Using closures to pass data 

```swift 
embeddedVC = ChildViewController(ctaAction: { [weak self] in
    guard let self = self else { return }
    self.showButton.isEnabled = true
    self.showButton.backgroundColor = .black
    self.messageLabel.text = "CTA button pressed."
    self.removeChildVC()
})
```
