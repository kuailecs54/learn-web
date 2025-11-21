import { Directive, ElementRef, HostBinding, Input, OnInit, OnDestroy } from '@angular/core';

@Directive({
  selector: '[appScrollAnimation]',
  standalone: true
})
export class ScrollAnimationDirective implements OnInit, OnDestroy {
  @Input() threshold = 0.1;
  @HostBinding('class.visible') isVisible = false;
  @HostBinding('class.fade-in-up') hasAnimationClass = true;

  private observer: IntersectionObserver | undefined;

  constructor(private el: ElementRef) {}

  ngOnInit() {
    this.observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          this.isVisible = true;
          this.observer?.unobserve(this.el.nativeElement);
        }
      });
    }, {
      threshold: this.threshold
    });

    this.observer.observe(this.el.nativeElement);
  }

  ngOnDestroy() {
    if (this.observer) {
      this.observer.disconnect();
    }
  }
}
