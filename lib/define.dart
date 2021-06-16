class define {
  final String path;
  final Object screen;

  const define({required this.path, required this.screen});
  const define.asHome({required this.screen}) : this.path = '/';
}
