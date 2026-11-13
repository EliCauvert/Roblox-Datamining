local ContextModule = require("@self/context")
local _ = require("@self/control_types")
local FreezeModule = require("@self/freeze")
local ControlEnvironmentModule = require("@self/control_environment")

local function _(p1)
	local v1 = false
	local v2 = nil
	
	return function()
		-- upvalues: v1 (ref), v2 (ref), p1 (copy)
		if not v1 then
			v2 = p1()
			v1 = true
		end
		return v2
	end
end

return function(p1, p2, p3)
	-- upvalues: ControlEnvironmentModule (copy), ContextModule (copy), FreezeModule (copy)
	local ControlEnvironmentModuleResult = ControlEnvironmentModule(p1)
	
	if p3 == nil then
		local ReadResultEntry = ControlEnvironmentModuleResult.read()[p2]
		
		if ReadResultEntry ~= nil then
			return ReadResultEntry
		end
	end
	local ContextModuleResult = ContextModule(p1, p2, p3)
	local v1 = nil
	local config = {
		provide = function(p4)
			-- upvalues: ControlEnvironmentModuleResult (copy), p2 (copy), v1 (ref)
			local Copy = table.clone(ControlEnvironmentModuleResult.read())
			Copy[p2] = v1
			
			return ControlEnvironmentModuleResult.provide(Copy, p4)
		end
	}
	
	local function v12()
		-- upvalues: ContextModuleResult (copy)
		return require("@self/nav_modal")(ContextModuleResult)
	end
	
	local v2 = false
	local v3 = nil
	
	local function v15()
		-- upvalues: v2 (ref), v3 (ref), v12 (copy)
		if not v2 then
			v3 = v12()
			v2 = true
		end
		return v3
	end
	
	local function v16()
		-- upvalues: ContextModuleResult (copy)
		return require("@self/input_kit")(ContextModuleResult)
	end
	
	local v4 = false
	local v5 = nil
	
	local function v19()
		-- upvalues: v4 (ref), v5 (ref), v16 (copy)
		if not v4 then
			v5 = v16()
			v4 = true
		end
		return v5
	end
	
	local function v20()
		-- upvalues: ContextModuleResult (copy)
		return require("@self/media_shared")(ContextModuleResult)
	end
	
	local v6 = false
	local v7 = nil
	
	local function v23()
		-- upvalues: v6 (ref), v7 (ref), v20 (copy)
		if not v6 then
			v7 = v20()
			v6 = true
		end
		return v7
	end
	
	local function v24()
		-- upvalues: ContextModuleResult (copy)
		return require("@self/nav_surface_parts")(ContextModuleResult)
	end
	
	local v8 = false
	local v9 = nil
	
	local function v27()
		-- upvalues: v8 (ref), v9 (ref), v24 (copy)
		if not v8 then
			v9 = v24()
			v8 = true
		end
		return v9
	end
	
	local function v28()
		-- upvalues: ContextModuleResult (copy)
		return require("@self/nav_page_layers")(ContextModuleResult)
	end
	
	local v10 = false
	local v11 = nil
	
	local function v31()
		-- upvalues: v10 (ref), v11 (ref), v28 (copy)
		if not v10 then
			v11 = v28()
			v10 = true
		end
		return v11
	end
	
	local function v32()
		-- upvalues: ContextModuleResult (copy), config (copy)
		return require("@self/collections")(ContextModuleResult, config)
	end
	
	local v12 = false
	local v13 = nil
	
	local function v35()
		-- upvalues: v12 (ref), v13 (ref), v32 (copy)
		if not v12 then
			v13 = v32()
			v12 = true
		end
		return v13
	end
	
	local function deferredHelp(p4, p5, p6)
		-- upvalues: v15 (copy), ContextModuleResult (copy), deferredHelp (copy)
		v15()
		local ShowHelpFunction: (any, any, any) -> () = ContextModuleResult.showHelp
		
		if type(ShowHelpFunction) == "function" and ShowHelpFunction ~= deferredHelp then
			ShowHelpFunction(p4, p5, p6)
		end
	end
	
	ContextModuleResult.showHelp = deferredHelp
	local Loads = {}
	local List = {}
	
	for _, value in {
		{
			names = { "worldSurface" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/world_surface")(ContextModuleResult, config)
			end
		},
		{
			names = {
				"VStack", "HStack", "Screen", "ZStack", "Group", "ScrollView", "Grid",
				"AdaptiveStack", "ViewThatFits", "ErrorBoundary", "Divider", "Spacer", "fill"
			},
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/layout")(ContextModuleResult, config)
			end
		},
		{
			names = { "Region", "Composition" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/composition")(ContextModuleResult, config)
			end
		},
		{
			names = { "Button" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v19 (copy)
				require("@self/input_button")(ContextModuleResult, config, v19())
			end
		},
		{
			names = { "Toggle" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v19 (copy)
				require("@self/input_toggle")(ContextModuleResult, config, v19())
			end
		},
		{
			names = { "TextInput", "NumberInput" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/text_field")(ContextModuleResult, config)
			end
		},
		{
			names = { "Stepper" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v19 (copy)
				require("@self/input_stepper")(ContextModuleResult, config, v19())
			end
		},
		{
			names = { "feedback", "adjustable" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v19 (copy)
				require("@self/input_actions")(ContextModuleResult, config, v19())
			end
		},
		{
			names = { "Slider" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v19 (copy)
				require("@self/slider")(ContextModuleResult, config, v19())
			end
		},
		{
			names = { "LevelPicker", "Rating" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v19 (copy)
				require("@self/input_level")(ContextModuleResult, config, v19())
			end
		},
		{
			names = { "Chip" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v19 (copy)
				require("@self/input_chip")(ContextModuleResult, config, v19())
			end
		},
		{
			names = { "ShortcutHint" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v19 (copy)
				require("@self/input_shortcut_hint")(ContextModuleResult, config, v19())
			end
		},
		{
			names = { "ButtonGuide" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v19 (copy)
				require("@self/input_button_guide")(ContextModuleResult, config, v19())
			end
		},
		{
			names = { "commandScope" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/command_scope")(ContextModuleResult, config)
			end
		},
		{
			names = { "Menu", "Picker", "SplitButton", "ComboBox" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v15 (copy)
				require("@self/nav_menu")(ContextModuleResult, config, v15())
			end
		},
		{
			names = { "DisclosureGroup" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v15 (copy), v27 (copy)
				require("@self/nav_disclosure")(ContextModuleResult, config, v15(), v27())
			end
		},
		{
			names = { "CollapsibleView" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v15 (copy), v27 (copy)
				require("@self/nav_collapsible")(ContextModuleResult, config, v15(), v27())
			end
		},
		{
			names = { "Alert" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v15 (copy), v27 (copy)
				require("@self/nav_alert")(ContextModuleResult, config, v15(), v27())
			end
		},
		{
			names = { "Callout" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v15 (copy), v27 (copy)
				require("@self/nav_callout")(ContextModuleResult, config, v15(), v27())
			end
		},
		{
			names = { "Sheet" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v15 (copy)
				require("@self/nav_sheet")(ContextModuleResult, config, v15())
			end
		},
		{
			names = { "Dialog" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v15 (copy)
				require("@self/nav_dialog")(ContextModuleResult, config, v15())
			end
		},
		{
			names = { "Popover" },
			install = function()
				-- upvalues: Loads (copy), ContextModuleResult (copy), config (copy), v15 (copy)
				Loads.Sheet()
				require("@self/nav_popover")(ContextModuleResult, config, v15())
			end
		},
		{
			names = { "Notice", "NavBar" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v15 (copy)
				require("@self/nav_notice")(ContextModuleResult, config, v15())
			end
		},
		{
			names = { "Toast" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v15 (copy)
				require("@self/nav_toast")(ContextModuleResult, config, v15())
			end
		},
		{
			names = { "TabView" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v15 (copy), v31 (copy)
				require("@self/nav_tab_view")(ContextModuleResult, config, v15(), v31())
			end
		},
		{
			names = { "NavigationStack" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v15 (copy), v31 (copy)
				require("@self/nav_stack")(ContextModuleResult, config, v15(), v31())
			end
		},
		{
			names = { "PageView" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v15 (copy), v31 (copy)
				require("@self/nav_page_view")(ContextModuleResult, config, v15(), v31())
			end
		},
		{
			names = { "RadialMenu" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v15 (copy)
				require("@self/nav_radial")(ContextModuleResult, config, v15())
			end
		},
		{
			names = { "Outline", "VirtualList", "VirtualGrid" },
			install = function()
				-- upvalues: v35 (copy)
				v35()
			end
		},
		{
			names = { "RowActions" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/collection_row_actions")(ContextModuleResult, config)
			end
		},
		{
			names = { "Table", "CellEditor" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v35 (copy)
				require("@self/collection_table")(ContextModuleResult, config, v35())
			end
		},
		{
			names = { "Text", "Label" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v23 (copy)
				require("@self/media_text")(ContextModuleResult, config, v23())
			end
		},
		{
			names = { "Image" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v23 (copy)
				require("@self/media_image")(ContextModuleResult, config, v23())
			end
		},
		{
			names = { "Badge", "StatusIndicator" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v23 (copy)
				require("@self/media_badge")(ContextModuleResult, config, v23())
			end
		},
		{
			names = { "Path" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/media_path")(ContextModuleResult, config)
			end
		},
		{
			names = { "ProgressView" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v23 (copy)
				require("@self/media_progress")(ContextModuleResult, config, v23())
			end
		},
		{
			names = { "Skeleton" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/media_skeleton")(ContextModuleResult, config)
			end
		},
		{
			names = { "AsyncImage" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v23 (copy)
				require("@self/media_async_image")(ContextModuleResult, config, v23())
			end
		},
		{
			names = { "Avatar", "AvatarGroup" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/media_avatar")(ContextModuleResult, config)
			end
		},
		{
			names = { "Stage" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v23 (copy)
				require("@self/media_stage")(ContextModuleResult, config, v23())
			end
		},
		{
			names = { "Timer" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/timer")(ContextModuleResult, config)
			end
		},
		{
			names = { "Typewriter" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/typewriter")(ContextModuleResult, config)
			end
		},
		{
			names = { "Pagination" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/pagination")(ContextModuleResult, config)
			end
		},
		{
			names = { "StepIndicator" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/step_indicator")(ContextModuleResult, config)
			end
		},
		{
			names = { "Vote" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/vote")(ContextModuleResult, config)
			end
		},
		{
			names = { "Card" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/card")(ContextModuleResult, config)
			end
		},
		{
			names = { "badged" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/badge_seal")(ContextModuleResult, config)
			end
		},
		{
			names = { "DateTimePicker" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v15 (copy)
				require("@self/date_time_picker")(ContextModuleResult, config, v15())
			end
		},
		{
			names = { "ColorPicker" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v15 (copy)
				require("@self/color_picker")(ContextModuleResult, config, v15())
			end
		},
		{
			names = {
				"focusRing",
				"environment",
				"responder",
				"focusSection",
				"worldAnchor"
			},
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/environment")(ContextModuleResult, config)
			end
		},
		{
			names = { "gestureArbiter", "draggable", "dropTarget" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/drag")(ContextModuleResult, config)
			end
		},
		{
			names = { "SpatialGrid" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/spatial_grid")(ContextModuleResult, config)
			end
		},
		{
			names = { "scrollTo", "scrollToVisible" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/scrolling")(ContextModuleResult, config)
			end
		},
		{
			names = { "NavigationSplitView" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v15 (copy)
				require("@self/navigation_split_view")(ContextModuleResult, config, v15())
			end
		},
		{
			names = { "countUp", "follow", "toward", "sequence" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/effect_sequence")(ContextModuleResult, config)
			end
		},
		{
			names = { "shake" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/effect_shake")(ContextModuleResult, config)
			end
		},
		{
			names = { "Flash" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v15 (copy)
				require("@self/effect_flash")(ContextModuleResult, config, v15())
			end
		},
		{
			names = { "ZoomView" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/zoom_view")(ContextModuleResult, config)
			end
		},
		{
			names = { "Travel" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy), v15 (copy)
				require("@self/travel")(ContextModuleResult, config, v15())
			end
		},
		{
			names = { "DiegeticScreen" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/diegetic_screen")(ContextModuleResult, config)
			end
		},
		{
			names = { "cameraRig" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/camera_rig")(ContextModuleResult, config)
			end
		},
		{
			names = { "WorldMarker" },
			install = function()
				-- upvalues: ContextModuleResult (copy), config (copy)
				require("@self/world_marker")(ContextModuleResult, config)
			end
		}
	} do
		local Flag = false
		
		local function load()
			-- upvalues: Flag (ref), value (copy)
			if Flag then return end
			Flag = true
			local Success, Result = pcall(function(): boolean
				-- upvalues: value (upval)
				value.install()
				
				return true
			end)
			
			if not Success then
				Flag = false
				error(Result, 0)
			end
		end
		
		for _, name in value.names do
			Loads[name] = load
		end
		table.insert(List, load)
	end
	setmetatable(config, {
		__index = function(_, p4)
			-- upvalues: Loads (copy), config (copy)
			if type(p4) ~= "string" then
				return nil
			end
			local Load: () -> () = Loads[p4]
			
			if Load == nil then
				return nil
			else
				Load()
				
				return (rawget(config, p4))
			end
		end
	})
	Loads.scrollTo()
	v1 = FreezeModule((setmetatable({}, {
		__index = config,
		__iter = function()
			-- upvalues: List (copy), config (copy)
			for _, value in List do
				value()
			end
			return next, config
		end
	})))
	
	return v1
end