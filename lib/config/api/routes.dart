abstract class Routes {
  static const _baseUrl = '192.168.1.7:9100';

  static get properties => Uri.http(_baseUrl, '/properties');
  static get categories => Uri.http(_baseUrl, '/categories');
}
