local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Workspace.Packages.RobloxAppHooks)
local _ = require(CorePackages.Workspace.Packages.Style)
local UiMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).UiMode
local LayoutConfig = require(CorePackages.Workspace.Packages.RobloxAppEnums).LayoutConfig
local DiscoveryTypesModule = require(CorePackages.Workspace.Packages.DiscoveryTypes)
local WideGameTileViewConfig = require(CorePackages.Workspace.Packages.GameTile).WideGameTileViewConfig
local GetFFlagLuaAppUpdateGameSortGridRowHeight10ftFunction = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Flags.GetFFlagLuaAppUpdateGameSortGridRowHeight10ft

local function _(p1, p2)
	return p1 * p2.Stroke.Standard
end

local Kind = LayoutConfig.Kind
local Keys = LayoutConfig.Keys
local config = {
	sd = { min = 0, max = 1024 },
	hd = { min = 1024, max = 1280 },
	hd_ts = { min = 1280, max = 1440 },
	fhd = { min = 1440, max = 1920 },
	fhd_ts = { min = 1920, max = 2260 },
	["2k"] = { min = 2260, max = 2560 },
	["2k_ts"] = { min = 2560, max = 3240 },
	["4k"] = { min = 3240, max = 3840 },
	["6k"] = { min = 3840, max = 1e999 }
}
local T = nil

return function(p1, p2)
	-- upvalues: T (ref), config (copy), Kind (copy), Keys (copy), GetFFlagLuaAppUpdateGameSortGridRowHeight10ftFunction (copy), UiMode (copy), DiscoveryTypesModule (copy), WideGameTileViewConfig (copy)
	T = {}
	
	for i, value in config do
		T[i] = {
			min = value.min * p2.Stroke.Standard,
			max = value.max * p2.Stroke.Standard
		}
	end
	local config1 = {
		breakpoints = if T then T else config,
		kinds = Kind,
		grid = {
			default = {
				scrollableMaxTilesPerRow = 20,
				margin = p2.Size.Size_1200,
				gutter = p2.Size.Size_1200,
				columns = { default = 4 }
			},
			sd = {
				margin = p2.Size.Size_300,
				gutter = p2.Size.Size_300,
				verticalGutter = 34 * p2.Stroke.Standard,
				columns = {
					[Kind.Experiences.Default] = 4,
					[Kind.Experiences.WithFooter] = 4,
					[Kind.Experiences.AppGameTile] = 4,
					[Kind.Experiences.GridTile] = 4,
					[Kind.Experiences.EventTile] = 4,
					[Kind.Friends] = 8
				}
			},
			hd = {
				margin = 18 * p2.Stroke.Standard,
				gutter = 18 * p2.Stroke.Standard,
				verticalGutter = 34 * p2.Stroke.Standard,
				columns = {
					[Kind.Experiences.Default] = 6,
					[Kind.Experiences.WithFooter] = 6,
					[Kind.Experiences.AppGameTile] = 6,
					[Kind.Experiences.GridTile] = 4,
					[Kind.Experiences.EventTile] = 4,
					[Kind.Friends] = 10
				}
			},
			hd_ts = {
				margin = p2.Size.Size_600,
				gutter = p2.Size.Size_600,
				verticalGutter = 34 * p2.Stroke.Standard,
				columns = {
					[Kind.Experiences.Default] = 7,
					[Kind.Experiences.WithFooter] = 7,
					[Kind.Experiences.AppGameTile] = 7,
					[Kind.Experiences.GridTile] = 4,
					[Kind.Experiences.EventTile] = 4,
					[Kind.Friends] = 12
				}
			},
			fhd = {
				margin = 34 * p2.Stroke.Standard,
				gutter = 34 * p2.Stroke.Standard,
				columns = {
					[Kind.Experiences.Default] = 8,
					[Kind.Experiences.WithFooter] = 8,
					[Kind.Experiences.AppGameTile] = 8,
					[Kind.Experiences.GridTile] = 4,
					[Kind.Experiences.EventTile] = 4,
					[Kind.Friends] = 12
				}
			},
			fhd_ts = {
				margin = 38 * p2.Stroke.Standard,
				gutter = 38 * p2.Stroke.Standard,
				columns = {
					[Kind.Experiences.Default] = 9,
					[Kind.Experiences.WithFooter] = 9,
					[Kind.Experiences.AppGameTile] = 9,
					[Kind.Experiences.GridTile] = 4,
					[Kind.Experiences.EventTile] = 4,
					[Kind.Friends] = 12
				}
			},
			["2k"] = {
				columns = {
					[Kind.Experiences.Default] = 10,
					[Kind.Experiences.WithFooter] = 10,
					[Kind.Experiences.AppGameTile] = 10,
					[Kind.Experiences.GridTile] = 6,
					[Kind.Experiences.EventTile] = 4,
					[Kind.Friends] = 14
				}
			},
			["2k_ts"] = {
				columns = {
					[Kind.Experiences.Default] = 11,
					[Kind.Experiences.WithFooter] = 11,
					[Kind.Experiences.AppGameTile] = 11,
					[Kind.Experiences.GridTile] = 6,
					[Kind.Experiences.EventTile] = 4,
					[Kind.Friends] = 16
				}
			},
			["4k"] = {
				columns = {
					[Kind.Experiences.Default] = 12,
					[Kind.Experiences.WithFooter] = 12,
					[Kind.Experiences.AppGameTile] = 12,
					[Kind.Experiences.GridTile] = 6,
					[Kind.Experiences.EventTile] = 4,
					[Kind.Friends] = 20
				}
			},
			["6k"] = {
				width = 3840 * p2.Stroke.Standard,
				columns = {
					[Kind.Experiences.Default] = 12,
					[Kind.Experiences.WithFooter] = 12,
					[Kind.Experiences.AppGameTile] = 12,
					[Kind.Experiences.GridTile] = 6,
					[Kind.Experiences.EventTile] = 4,
					[Kind.Friends] = 20
				}
			}
		},
		tiles = {
			hover = {
				topOffset = 10 * p2.Stroke.Standard,
				bottomOffset = 22 * p2.Stroke.Standard,
				horizontalOffset = -4 * p2.Stroke.Standard
			}
		},
		topBar = {
			gutter = p2.Size.Size_400,
			columns = 1,
			[Keys.PaddingRightItems] = p2.Size.Size_400,
			[Keys.PaddingVertical] = p2.Size.Size_400
		},
		layoutTypes = {
			[Kind.Friends] = {
				relativeHeight = { Scale = 1, Offset = 44 * p2.Stroke.Standard }
			},
			[Kind.Experiences.Default] = {
				relativeHeight = { Scale = 1, Offset = 60 * p2.Stroke.Standard }
			},
			[Kind.Experiences.WithFooter] = {
				relativeHeight = {
					Scale = 1,
					Offset = if GetFFlagLuaAppUpdateGameSortGridRowHeight10ftFunction() and p1.uiMode == UiMode.TenFoot then 98 * p2.Stroke.Standard else 82 * p2.Stroke.Standard
				}
			},
			[Kind.Experiences.AppGameTile] = {
				relativeHeight = {
					Scale = 1,
					Offset = DiscoveryTypesModule.Constants.GAME_GRID_TILE_FOOTER_HEIGHT * p2.Stroke.Standard
				}
			},
			[Kind.Experiences.GridTile] = {
				gutter = p2.Size.Size_600,
				relativeHeight = {
					Scale = 0.5625,
					Offset = WideGameTileViewConfig.getFooterHeight(p2)
				}
			},
			[Kind.Experiences.EventTile] = {
				gutter = p2.Size.Size_600,
				relativeHeight = {
					Scale = 0.5625,
					Offset = WideGameTileViewConfig.getFooterHeight(p2)
				}
			}
		}
	}
	
	if p1.uiMode == UiMode.TenFoot then
		config1.grid.fhd.margin = 0 * p2.Stroke.Standard
		config1.grid.fhd.gutter = p2.Size.Size_600
		config1.grid.fhd.verticalGutter = 0 * p2.Stroke.Standard
		config1.grid.fhd.columns[Kind.Friends] = 12
	end
	return config1
end