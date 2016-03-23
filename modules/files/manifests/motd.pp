
define files::motd ($message, $order) {
  concat::fragment { $message:
    target  => '/etc/motd',
    content => $message,
    order   => $order,
  }
}
