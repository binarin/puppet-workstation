Facter.add(:xkb_symbols_ru) do
  setcode do
    orig_name = '/usr/share/X11/xkb/symbols/ru.orig'
    concat_name = '/usr/share/X11/xkb/symbols/ru'
    File.read(File.exists?(orig_name) ? orig_name : concat_name)
  end
end
