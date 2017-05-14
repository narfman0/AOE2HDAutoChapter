AOE2HDAutoChapter
=================

Automatically save an aoe2hd chapter every several minutes! 6 by default

Usage
-----

Run aoe2hd_auto_chapter. Note: in your system tray there is now a red circular icon

The bot starts PAUSED. To unpause, press the F5 key. This toggles, so pause
again with F5 and so on. This will change the system tray icon from red (paused)
to green (active and pressing F5).

Enjoy! Chapter should be saved every several minutes! Hurrah!

Configuration
-------------

There are a few configurable settings in the `settings.ini` file.

`interval` - interval between invoking the desired keypress, in milliseconds

`debug` - enable/disable debug mode. This shows message boxes on startup and
whenever the keypress is triggered. Valid values: 0 for disabled (default), 1
for enabled.

`pauseKey` - If you wish to change the pause key, set it here. Default: F5

`chapterKey` - The key which is pressed after every `interval`. Default: F9