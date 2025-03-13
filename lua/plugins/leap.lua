return {
  'ggandor/leap.nvim',
  config = function()
    local leap = require('leap')
    vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
    vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')
    leap.opts.special_keys.next_target = { ';', '<enter>' }
    leap.opts.labels = {
		"s",
		"f",
		"n",
		"S",
		"/",
		"r",
		"d",
		"w",
		"e",
		"m",
		"b",
		"t",
		"F",
		"N",
		"J",
		"K",
		"L",
		"H",
		"D",
		"W",
		"E",
		"M",
		"B",
		"T",
	}
  end
}
