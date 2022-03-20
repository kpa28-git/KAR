import os
import yaml
import subprocess
from datetime import datetime, time


def qb_config():
	"""
	Top level config function.
	Set options from config.yml, find defaults in defaults.py (:config-write-py -d defaults.py to refresh).

	Base16 schemes are loaded from .Xresources or a base16 yaml file via the 'custom.base16.file' option,
	uses the default qutebrowser color scheme if this option is null or empty.
	"""
	with (config.configdir / 'config.yml').open() as f:
		yaml_data = yaml.safe_load(f)

		# STANDARD
		for k, v in filter(lambda i: not i[0].startswith('custom.'), yaml_data.items()):
			config.set(k, v)

		# CUSTOM
		## KEYBINDS
		for key, action in yaml_data['custom.keybinds'].items():
			config.bind(key, action)

		## BASE16
		chosen = yaml_data['custom.base16.file']
		if (chosen):
			if ('.Xresources' in chosen):
				xpfx = '*.'
				base16 = dict(filter(lambda i: 'color' in i[0], read_xresources(xpfx).items()))
			else:
				with open(chosen) as base16_file:
					base16 = yaml.safe_load(base16_file)
			qb_config_base16_load({k:'#'+v for k,v in base16.items()})

		## DAY / NIGHT THEME
		timenow = datetime.now().time()
		timeday = datetime.strptime(os.getenv("TIMEDAY"), "%H:%M").time()
		timenight = datetime.strptime(os.getenv("TIMENIGHT"), "%H:%M").time()
		if (timenow < timeday or timenow > timenight):
			c.colors.webpage.preferred_color_scheme = 'dark'
		else:
			c.colors.webpage.preferred_color_scheme = 'light'

		config.load_autoconfig(False)

def read_xresources(prefix):
	"""
	Get ~/.Xresources file properties.
	Source: https://www.qutebrowser.org/doc/help/configuring.html
	"""
	props = {}
	x = subprocess.run(['xrdb', '-query'], stdout=subprocess.PIPE)
	lines = x.stdout.decode().split('\n')
	for line in filter(lambda l : l.startswith(prefix), lines):
		prop, _, value = line.partition(':\t')
		props[prop] = value
	return props

def qb_config_base16_load(colors):
	"""
	Set qutebrowser colors via base16 dictionary
	Base16 qb Template by theova: https://github.com/theova/base16-qutebrowser

	Args:
		colors (dict): dictionary of base16 hex colors

	Returns:
		None
	"""
	# Text color of the completion widget. May be a single color to use for
	# all columns or a list of three colors, one for each column.
	c.colors.completion.fg = colors['base05']

	# Background color of the completion widget for odd rows.
	c.colors.completion.odd.bg = colors['base03']

	# Background color of the completion widget for even rows.
	c.colors.completion.even.bg = colors['base00']

	# Foreground color of completion widget category headers.
	c.colors.completion.category.fg = colors['base0A']

	# Background color of the completion widget category headers.
	c.colors.completion.category.bg = colors['base00']

	# Top border color of the completion widget category headers.
	c.colors.completion.category.border.top = colors['base00']

	# Bottom border color of the completion widget category headers.
	c.colors.completion.category.border.bottom = colors['base00']

	# Foreground color of the selected completion item.
	c.colors.completion.item.selected.fg = colors['base01']

	# Background color of the selected completion item.
	c.colors.completion.item.selected.bg = colors['base0A']

	# Top border color of the completion widget category headers.
	c.colors.completion.item.selected.border.top = colors['base0A']

	# Bottom border color of the selected completion item.
	c.colors.completion.item.selected.border.bottom = colors['base0A']

	# Foreground color of the matched text in the completion.
	c.colors.completion.match.fg = colors['base0B']

	# Color of the scrollbar handle in the completion view.
	c.colors.completion.scrollbar.fg = colors['base05']

	# Color of the scrollbar in the completion view.
	c.colors.completion.scrollbar.bg = colors['base00']

	# Background color for the download bar.
	c.colors.downloads.bar.bg = colors['base00']

	# Color gradient start for download text.
	c.colors.downloads.start.fg = colors['base00']

	# Color gradient start for download backgrounds.
	c.colors.downloads.start.bg = colors['base0D']

	# Color gradient end for download text.
	c.colors.downloads.stop.fg = colors['base00']

	# Color gradient stop for download backgrounds.
	c.colors.downloads.stop.bg = colors['base0C']

	# Foreground color for downloads with errors.
	c.colors.downloads.error.fg = colors['base08']

	# Font color for hints.
	c.colors.hints.fg = colors['base00']

	# Background color for hints. Note that you can use a `rgba(...)` value for transparency.
	c.colors.hints.bg = colors['base0A']

	# Font color for the matched part of hints.
	c.colors.hints.match.fg = colors['base05']

	# Text color for the keyhint widget.
	c.colors.keyhint.fg = colors['base05']

	# Highlight color for keys to complete the current keychain.
	c.colors.keyhint.suffix.fg = colors['base05']

	# Background color of the keyhint widget.
	c.colors.keyhint.bg = colors['base00']

	# Foreground color of an error message.
	c.colors.messages.error.fg = colors['base00']

	# Background color of an error message.
	c.colors.messages.error.bg = colors['base08']

	# Border color of an error message.
	c.colors.messages.error.border = colors['base08']

	# Foreground color of a warning message.
	c.colors.messages.warning.fg = colors['base00']

	# Background color of a warning message.
	c.colors.messages.warning.bg = colors['base0E']

	# Border color of a warning message.
	c.colors.messages.warning.border = colors['base0E']

	# Foreground color of an info message.
	c.colors.messages.info.fg = colors['base05']

	# Background color of an info message.
	c.colors.messages.info.bg = colors['base00']

	# Border color of an info message.
	c.colors.messages.info.border = colors['base00']

	# Foreground color for prompts.
	c.colors.prompts.fg = colors['base05']

	# Border used around UI elements in prompts.
	c.colors.prompts.border = colors['base00']

	# Background color for prompts.
	c.colors.prompts.bg = colors['base00']

	# Background color for the selected item in filename prompts.
	c.colors.prompts.selected.bg = colors['base0A']

	# Foreground color of the statusbar.
	c.colors.statusbar.normal.fg = colors['base0A']

	# Background color of the statusbar.
	c.colors.statusbar.normal.bg = colors['base00']

	# Foreground color of the statusbar in insert mode.
	c.colors.statusbar.insert.fg = colors['base00']

	# Background color of the statusbar in insert mode.
	c.colors.statusbar.insert.bg = colors['base0A']

	# Foreground color of the statusbar in passthrough mode.
	c.colors.statusbar.passthrough.fg = colors['base00']

	# Background color of the statusbar in passthrough mode.
	c.colors.statusbar.passthrough.bg = colors['base0A']

	# Foreground color of the statusbar in private browsing mode.
	c.colors.statusbar.private.fg = colors['base00']

	# Background color of the statusbar in private browsing mode.
	c.colors.statusbar.private.bg = colors['base03']

	# Foreground color of the statusbar in command mode.
	c.colors.statusbar.command.fg = colors['base05']

	# Background color of the statusbar in command mode.
	c.colors.statusbar.command.bg = colors['base00']

	# Foreground color of the statusbar in private browsing + command mode.
	c.colors.statusbar.command.private.fg = colors['base05']

	# Background color of the statusbar in private browsing + command mode.
	c.colors.statusbar.command.private.bg = colors['base00']

	# Foreground color of the statusbar in caret mode.
	c.colors.statusbar.caret.fg = colors['base00']

	# Background color of the statusbar in caret mode.
	c.colors.statusbar.caret.bg = colors['base0E']

	# Foreground color of the statusbar in caret mode with a selection.
	c.colors.statusbar.caret.selection.fg = colors['base00']

	# Background color of the statusbar in caret mode with a selection.
	c.colors.statusbar.caret.selection.bg = colors['base0D']

	# Background color of the progress bar.
	c.colors.statusbar.progress.bg = colors['base0D']

	# Default foreground color of the URL in the statusbar.
	c.colors.statusbar.url.fg = colors['base05']

	# Foreground color of the URL in the statusbar on error.
	c.colors.statusbar.url.error.fg = colors['base08']

	# Foreground color of the URL in the statusbar for hovered links.
	c.colors.statusbar.url.hover.fg = colors['base05']

	# Foreground color of the URL in the statusbar on successful load
	# (http).
	c.colors.statusbar.url.success.http.fg = colors['base0C']

	# Foreground color of the URL in the statusbar on successful load
	# (https).
	c.colors.statusbar.url.success.https.fg = colors['base09']

	# Foreground color of the URL in the statusbar when there's a warning.
	c.colors.statusbar.url.warn.fg = colors['base0E']

	# Background color of the tab bar.
	c.colors.tabs.bar.bg = colors['base00']

	# Color gradient start for the tab indicator.
	c.colors.tabs.indicator.start = colors['base0D']

	# Color gradient end for the tab indicator.
	c.colors.tabs.indicator.stop = colors['base0C']

	# Color for the tab indicator on errors.
	c.colors.tabs.indicator.error = colors['base08']

	# Foreground color of unselected odd tabs.
	c.colors.tabs.odd.fg = colors['base05']

	# Background color of unselected odd tabs.
	c.colors.tabs.odd.bg = colors['base03']

	# Foreground color of unselected even tabs.
	c.colors.tabs.even.fg = colors['base05']

	# Background color of unselected even tabs.
	c.colors.tabs.even.bg = colors['base00']

	# Foreground color of selected odd tabs.
	c.colors.tabs.selected.odd.fg = colors['base00']

	# Background color of selected odd tabs.
	c.colors.tabs.selected.odd.bg = colors['base05']

	# Foreground color of selected even tabs.
	c.colors.tabs.selected.even.fg = colors['base00']

	# Background color of selected even tabs.
	c.colors.tabs.selected.even.bg = colors['base05']

	# Background color for webpages if unset (or empty to use the theme's color).
	# c.colors.webpage.bg = colors['base00']


qb_config()
