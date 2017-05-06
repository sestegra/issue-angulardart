import 'package:angular2/platform/browser.dart';
import 'package:angular2/core.dart';

@Component(
  selector: 'my-app',
  template: '''
      <h1>AngularDart 2.2.0</h1>
      <navbar></navbar>
      ''',
  directives: const [Navbar],
)
class AppComponent {}

@Component(
    selector: 'navbar',
    template: '''
        <div *ngFor="let content of contents">
          <navbar-tab [text]="content"></navbar-tab>
        </div>
        ''',
    styles: const [':host .tab-label-content a { color: red; }'],
    directives: const [NavbarTab])
class Navbar {
  Navbar();

  @Input()
  List<String> contents = ["Menu #1", "Menu #2"];
}

@Component(
    selector: 'navbar-tab',
    template: '''<a><span>{{text}}</span></a>''',
    host: const {"style": "display: block;", "class": "tab-label-content"})
class NavbarTab {
  @Input()
  String text;
}

void main() {
  bootstrap(AppComponent);
}
