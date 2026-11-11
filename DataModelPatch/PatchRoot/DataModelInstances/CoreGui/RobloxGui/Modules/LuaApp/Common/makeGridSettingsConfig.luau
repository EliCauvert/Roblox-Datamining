local CorePackages = game:GetService("CorePackages")
local LayoutConfig = require(CorePackages.Workspace.Packages.RobloxAppEnums).LayoutConfig
local _ = require(CorePackages.Workspace.Packages.Style)
local _ = require(CorePackages.Packages.UIBlox)

return function(p1)
	-- upvalues: LayoutConfig (copy)
	local Layout = p1.LuaApps.Layout
	local Breakpoints = Layout.breakpoints
	local Kinds = Layout.kinds
	local Grid = Layout.grid
	local Tiles = Layout.tiles
	local LayoutTypes = Layout.layoutTypes
	
	return {
		margin = Grid.default.margin,
		gutter = Grid.default.gutter,
		columns = Grid.default.columns.default,
		hoverTileTopOffset = Tiles.hover.topOffset,
		hoverTileBottomOffset = Tiles.hover.bottomOffset,
		hoverTileHorizontalOffset = Tiles.hover.horizontalOffset,
		scrollableMaxTilesPerRow = Grid.default.scrollableMaxTilesPerRow,
		{
			kind = Kinds.TopBar,
			columns = Layout.topBar.columns,
			gutter = Layout.topBar.gutter,
			[LayoutConfig.Keys.PaddingRightItems] = Layout.topBar[LayoutConfig.Keys.PaddingRightItems],
			[LayoutConfig.Keys.PaddingVertical] = Layout.topBar[LayoutConfig.Keys.PaddingVertical]
		},
		{
			kind = Kinds.Friends,
			relativeHeight = LayoutTypes[Kinds.Friends].relativeHeight
		},
		{
			margin = 48,
			kind = Kinds.Experiences.Default,
			relativeHeight = LayoutTypes[Kinds.Experiences.Default].relativeHeight
		},
		{
			kind = Kinds.Experiences.WithFooter,
			relativeHeight = LayoutTypes[Kinds.Experiences.WithFooter].relativeHeight
		},
		{
			margin = 48,
			kind = Kinds.Experiences.AppGameTile,
			relativeHeight = LayoutTypes[Kinds.Experiences.AppGameTile].relativeHeight
		},
		{
			kind = Kinds.Experiences.GridTile,
			relativeHeight = LayoutTypes[Kinds.Experiences.GridTile].relativeHeight,
			gutter = LayoutTypes[Kinds.Experiences.GridTile].gutter
		},
		{
			margin = 48,
			kind = Kinds.Experiences.EventTile,
			relativeHeight = LayoutTypes[Kinds.Experiences.EventTile].relativeHeight,
			gutter = LayoutTypes[Kinds.Experiences.EventTile].gutter
		},
		{
			breakpoint = "sd",
			min = Breakpoints.sd.min,
			max = Breakpoints.sd.max,
			margin = Grid.sd.margin,
			gutter = Grid.sd.gutter,
			verticalGutter = Grid.sd.verticalGutter,
			{
				kind = Kinds.Experiences,
				columns = Grid.sd.columns[Kinds.Experiences]
			},
			{
				kind = Kinds.Experiences.Default,
				columns = Grid.sd.columns[Kinds.Experiences.Default]
			},
			{
				kind = Kinds.Experiences.WithFooter,
				columns = Grid.sd.columns[Kinds.Experiences.WithFooter]
			},
			{
				kind = Kinds.Experiences.AppGameTile,
				columns = Grid.sd.columns[Kinds.Experiences.AppGameTile]
			},
			{
				kind = Kinds.Experiences.GridTile,
				columns = Grid.sd.columns[Kinds.Experiences.GridTile]
			},
			{
				kind = Kinds.Experiences.EventTile,
				columns = Grid.sd.columns[Kinds.Experiences.EventTile]
			},
			{
				kind = Kinds.Friends,
				columns = Grid.sd.columns[Kinds.Friends]
			}
		},
		{
			breakpoint = "hd",
			min = Breakpoints.hd.min,
			max = Breakpoints.hd.max,
			margin = Grid.hd.margin,
			gutter = Grid.hd.gutter,
			verticalGutter = Grid.hd.verticalGutter,
			{
				kind = Kinds.Experiences,
				columns = Grid.hd.columns[Kinds.Experiences]
			},
			{
				kind = Kinds.Experiences.Default,
				columns = Grid.hd.columns[Kinds.Experiences.Default]
			},
			{
				kind = Kinds.Experiences.WithFooter,
				columns = Grid.hd.columns[Kinds.Experiences.WithFooter]
			},
			{
				kind = Kinds.Experiences.AppGameTile,
				columns = Grid.hd.columns[Kinds.Experiences.AppGameTile]
			},
			{
				kind = Kinds.Experiences.GridTile,
				columns = Grid.hd.columns[Kinds.Experiences.GridTile]
			},
			{
				kind = Kinds.Experiences.EventTile,
				columns = Grid.hd.columns[Kinds.Experiences.EventTile]
			},
			{
				kind = Kinds.Friends,
				columns = Grid.hd.columns[Kinds.Friends]
			}
		},
		{
			breakpoint = "hd_ts",
			min = Breakpoints.hd_ts.min,
			max = Breakpoints.hd_ts.max,
			margin = Grid.hd_ts.margin,
			gutter = Grid.hd_ts.gutter,
			verticalGutter = Grid.hd_ts.verticalGutter,
			{
				kind = Kinds.Experiences,
				columns = Grid.hd_ts.columns[Kinds.Experiences]
			},
			{
				kind = Kinds.Experiences.Default,
				columns = Grid.hd_ts.columns[Kinds.Experiences.Default]
			},
			{
				kind = Kinds.Experiences.WithFooter,
				columns = Grid.hd_ts.columns[Kinds.Experiences.WithFooter]
			},
			{
				kind = Kinds.Experiences.AppGameTile,
				columns = Grid.hd_ts.columns[Kinds.Experiences.AppGameTile]
			},
			{
				kind = Kinds.Experiences.GridTile,
				columns = Grid.hd_ts.columns[Kinds.Experiences.GridTile]
			},
			{
				kind = Kinds.Experiences.EventTile,
				columns = Grid.hd_ts.columns[Kinds.Experiences.EventTile]
			},
			{
				kind = Kinds.Friends,
				columns = Grid.hd_ts.columns[Kinds.Friends]
			}
		},
		{
			breakpoint = "fhd",
			min = Breakpoints.fhd.min,
			max = Breakpoints.fhd.max,
			margin = Grid.fhd.margin,
			gutter = Grid.fhd.gutter,
			{
				kind = Kinds.Experiences,
				columns = Grid.fhd.columns[Kinds.Experiences]
			},
			{
				kind = Kinds.Experiences.Default,
				columns = Grid.fhd.columns[Kinds.Experiences.Default]
			},
			{
				kind = Kinds.Experiences.WithFooter,
				columns = Grid.fhd.columns[Kinds.Experiences.WithFooter]
			},
			{
				kind = Kinds.Experiences.AppGameTile,
				columns = Grid.fhd.columns[Kinds.Experiences.AppGameTile]
			},
			{
				kind = Kinds.Experiences.GridTile,
				columns = Grid.fhd.columns[Kinds.Experiences.GridTile]
			},
			{
				kind = Kinds.Experiences.EventTile,
				columns = Grid.fhd.columns[Kinds.Experiences.EventTile]
			},
			{
				kind = Kinds.Friends,
				columns = Grid.fhd.columns[Kinds.Friends]
			}
		},
		{
			breakpoint = "fhd_ts",
			min = Breakpoints.fhd_ts.min,
			max = Breakpoints.fhd_ts.max,
			margin = Grid.fhd_ts.margin,
			gutter = Grid.fhd_ts.gutter,
			{
				kind = Kinds.Experiences,
				columns = Grid.fhd_ts.columns[Kinds.Experiences]
			},
			{
				kind = Kinds.Experiences.Default,
				columns = Grid.fhd_ts.columns[Kinds.Experiences.Default]
			},
			{
				kind = Kinds.Experiences.WithFooter,
				columns = Grid.fhd_ts.columns[Kinds.Experiences.WithFooter]
			},
			{
				kind = Kinds.Experiences.AppGameTile,
				columns = Grid.fhd_ts.columns[Kinds.Experiences.AppGameTile]
			},
			{
				kind = Kinds.Experiences.GridTile,
				columns = Grid.fhd_ts.columns[Kinds.Experiences.GridTile]
			},
			{
				kind = Kinds.Experiences.EventTile,
				columns = Grid.fhd_ts.columns[Kinds.Experiences.EventTile]
			},
			{
				kind = Kinds.Friends,
				columns = Grid.fhd_ts.columns[Kinds.Friends]
			}
		},
		{
			breakpoint = "2k",
			min = Breakpoints["2k"].min,
			max = Breakpoints["2k"].max,
			{
				kind = Kinds.Experiences,
				columns = Grid["2k"].columns[Kinds.Experiences]
			},
			{
				kind = Kinds.Experiences.Default,
				columns = Grid["2k"].columns[Kinds.Experiences.Default]
			},
			{
				kind = Kinds.Experiences.WithFooter,
				columns = Grid["2k"].columns[Kinds.Experiences.WithFooter]
			},
			{
				kind = Kinds.Experiences.AppGameTile,
				columns = Grid["2k"].columns[Kinds.Experiences.AppGameTile]
			},
			{
				kind = Kinds.Experiences.GridTile,
				columns = Grid["2k"].columns[Kinds.Experiences.GridTile]
			},
			{
				kind = Kinds.Experiences.EventTile,
				columns = Grid["2k"].columns[Kinds.Experiences.EventTile]
			},
			{
				kind = Kinds.Friends,
				columns = Grid["2k"].columns[Kinds.Friends]
			}
		},
		{
			breakpoint = "2k_ts",
			min = Breakpoints["2k_ts"].min,
			max = Breakpoints["2k_ts"].max,
			{
				kind = Kinds.Experiences,
				columns = Grid["2k_ts"].columns[Kinds.Experiences]
			},
			{
				kind = Kinds.Experiences.Default,
				columns = Grid["2k_ts"].columns[Kinds.Experiences.Default]
			},
			{
				kind = Kinds.Experiences.WithFooter,
				columns = Grid["2k_ts"].columns[Kinds.Experiences.WithFooter]
			},
			{
				kind = Kinds.Experiences.AppGameTile,
				columns = Grid["2k_ts"].columns[Kinds.Experiences.AppGameTile]
			},
			{
				kind = Kinds.Experiences.GridTile,
				columns = Grid["2k_ts"].columns[Kinds.Experiences.GridTile]
			},
			{
				kind = Kinds.Experiences.EventTile,
				columns = Grid["2k_ts"].columns[Kinds.Experiences.EventTile]
			},
			{
				kind = Kinds.Friends,
				columns = Grid["2k_ts"].columns[Kinds.Friends]
			}
		},
		{
			breakpoint = "4k",
			min = Breakpoints["4k"].min,
			max = Breakpoints["4k"].max,
			{
				kind = Kinds.Experiences,
				columns = Grid["4k"].columns[Kinds.Experiences]
			},
			{
				kind = Kinds.Experiences.Default,
				columns = Grid["4k"].columns[Kinds.Experiences.Default]
			},
			{
				kind = Kinds.Experiences.WithFooter,
				columns = Grid["4k"].columns[Kinds.Experiences.WithFooter]
			},
			{
				kind = Kinds.Experiences.AppGameTile,
				columns = Grid["4k"].columns[Kinds.Experiences.AppGameTile]
			},
			{
				kind = Kinds.Experiences.GridTile,
				columns = Grid["4k"].columns[Kinds.Experiences.GridTile]
			},
			{
				kind = Kinds.Experiences.EventTile,
				columns = Grid["4k"].columns[Kinds.Experiences.EventTile]
			},
			{
				kind = Kinds.Friends,
				columns = Grid["4k"].columns[Kinds.Friends]
			}
		},
		{
			breakpoint = "6k",
			min = Breakpoints["6k"].min,
			max = Breakpoints["6k"].max,
			width = Grid["6k"].width,
			{
				kind = Kinds.Experiences,
				columns = Grid["6k"].columns[Kinds.Experiences]
			},
			{
				kind = Kinds.Experiences.Default,
				columns = Grid["6k"].columns[Kinds.Experiences.Default]
			},
			{
				kind = Kinds.Experiences.WithFooter,
				columns = Grid["6k"].columns[Kinds.Experiences.WithFooter]
			},
			{
				kind = Kinds.Experiences.AppGameTile,
				columns = Grid["6k"].columns[Kinds.Experiences.AppGameTile]
			},
			{
				kind = Kinds.Experiences.GridTile,
				columns = Grid["6k"].columns[Kinds.Experiences.GridTile]
			},
			{
				kind = Kinds.Experiences.EventTile,
				columns = Grid["6k"].columns[Kinds.Experiences.EventTile]
			},
			{
				kind = Kinds.Friends,
				columns = Grid["6k"].columns[Kinds.Friends]
			}
		}
	}
end