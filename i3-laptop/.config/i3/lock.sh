# i3lock-fancy-rapid 25 2
# exec xautolock -detectsleep \
  # -time 1 \
  # -locker "i3lock-fancy-rapid 25 2" \
  # -notify 30 \
  # -notifier "notify-send -u critical -t 10000  'System is about to autolock'"

exec xautolock -detectsleep \
  -time 20 \
  -locker "i3lock-fancy-rapid 25 2 && systemctl hibernate" \
  -notify 30 \
  -notifier "notify-send -u critical -t 10000  'System is about to hibernate'"
