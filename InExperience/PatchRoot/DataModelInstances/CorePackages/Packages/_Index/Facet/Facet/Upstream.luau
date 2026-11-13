local _ = require("@self/vendor/compose/design/types")
local _ = require("@self/design/types")
local _ = require("@self/ui/control_types")
local _ = require("@self/ui/diegetic_types")
local _ = require("@self/ui/camera_rig_types")
local _ = require("@self/ui/types")
local StyleTagsModule = require("@self/ui/style_tags")
local _ = require("@self/ui/collection_props")
local _ = require("@self/ui/spatial_grid_props")
local _ = require("@self/ui/content_props")
local _ = require("@self/ui/effect_props")
local _ = require("@self/ui/input_props")
local _ = require("@self/ui/layout_props")
local _ = require("@self/ui/media_props")
local _ = require("@self/ui/hud_props")
local _ = require("@self/ui/hud_types")
local FormatModule = require("@self/ui/format")
local _ = require("@self/ui/review_types")
local v1 = nil

local function _()
	-- upvalues: v1 (ref)
	local ReviewModule = v1
	
	if ReviewModule == nil then
		ReviewModule = require("@self/ui/review")
		v1 = ReviewModule
	end
	return ReviewModule
end

local Frozen = table.freeze({
	analyze = function(...)
		-- upvalues: v1 (ref)
		local ReviewModule = v1
		
		if ReviewModule == nil then
			ReviewModule = require("@self/ui/review")
			v1 = ReviewModule
		end
		return ReviewModule.analyze(...)
	end,
	collect = function(...)
		-- upvalues: v1 (ref)
		local ReviewModule = v1
		
		if ReviewModule == nil then
			ReviewModule = require("@self/ui/review")
			v1 = ReviewModule
		end
		return ReviewModule.collect(...)
	end,
	paintRect = function(...)
		-- upvalues: v1 (ref)
		local ReviewModule = v1
		
		if ReviewModule == nil then
			ReviewModule = require("@self/ui/review")
			v1 = ReviewModule
		end
		return ReviewModule.paintRect(...)
	end,
	screen = function(...)
		-- upvalues: v1 (ref)
		local ReviewModule = v1
		
		if ReviewModule == nil then
			ReviewModule = require("@self/ui/review")
			v1 = ReviewModule
		end
		return ReviewModule.screen(...)
	end,
	screens = function(...)
		-- upvalues: v1 (ref)
		local ReviewModule = v1
		
		if ReviewModule == nil then
			ReviewModule = require("@self/ui/review")
			v1 = ReviewModule
		end
		return ReviewModule.screens(...)
	end,
	fixes = table.freeze((setmetatable({}, {
		__index = function(_, p1)
			-- upvalues: v1 (ref)
			local ReviewModule = v1
			
			if ReviewModule == nil then
				ReviewModule = require("@self/ui/review")
				v1 = ReviewModule
			end
			return ReviewModule.fixes[p1]
		end,
		__iter = function()
			-- upvalues: v1 (ref)
			local Iterator = next
			local ReviewModule = v1
			
			if ReviewModule == nil then
				ReviewModule = require("@self/ui/review")
				v1 = ReviewModule
			end
			return Iterator, ReviewModule.fixes
		end
	})))
})
local _ = require("@self/ui/navigation_props")
local _ = require("@self/ui/overlay_props")
local _ = require("@self/ui/radial_props")
local _ = require("@self/ui/zoom_travel_props")
local UiModule = require("@self/ui")
local ThemesModule = require("@self/ui/themes")
local _ = require("@self/ui/input_types")
local _ = require("@self/ui/command_types")
local _ = require("@self/ui/navigation_types")
local _ = require("@self/ui/radial_types")
local _ = require("@self/ui/collection_types")
local _ = require("@self/ui/media_types")
local _ = require("@self/ui/content_types")
local _ = require("@self/ui/theme_types")
local _ = require("@self/ui/layout_types")
local AppModule = require("@self/ui/app")
local _ = require("@self/ui/overlay_types")
local _ = require("@self/ui/color_picker_types")
local _ = require("@self/ui/date_time_picker_types")
local CivilDateModule = require("@self/ui/civil_date")
local _ = require("@self/ui/civil_date_types")
local AdaptiveModule = require("@self/ui/adaptive")
local GamepadContentionModule = require("@self/ui/gamepad_contention")
local NavPathShapesModule = require("@self/ui/nav_path_shapes")
local RichTextModule = require("@self/ui/rich_text")
local _ = require("@self/ui/gesture_arbitration")
local _ = require("@self/ui/environment_types")
local FreezeModule = require("@self/ui/freeze")
local _ = require("@self/ui/effect_types")
local _ = require("@self/ui/zoom_travel_types")
local Frozen1 = table.freeze({ belowControls = 25, aboveFacet = 12000 })
local list = {
	"boundary", "cell", "cleanup", "createContext", "createFocusScope",
	"createPool", "createSharedResource", "currentOwner", "focusNeighbor",
	"formula", "fragment", "isValue", "keyed", "portal", "presence", "sharedCell",
	"show", "static", "switch", "watch", "withOwner", "withRootOwner"
}
local FreezeModuleResult = FreezeModule({
	arithmetic = FreezeModule({ parse = require("@self/ui/arithmetic").parse })
})

local function bind(Compose, Roblox)
	-- upvalues: list (copy), ThemesModule (copy), StyleTagsModule (copy), UiModule (copy), FreezeModule (copy), AppModule (copy), CivilDateModule (copy), AdaptiveModule (copy), GamepadContentionModule (copy), NavPathShapesModule (copy), RichTextModule (copy), FormatModule (copy), Frozen (copy), FreezeModuleResult (copy), Frozen1 (copy), bind (copy)
	for _, value in list do
		if type(Compose[value]) ~= "function" then
			error(`Facet.bind: this Compose has no function '{value}'. Facet 0.12.0 supports Compose ` .. "90f0209 and later commits that keep the functions Facet uses.", 2)
		end
	end
	if type(Roblox) ~= "table" or type(Roblox.createRuntime) ~= "function" then
		error("Facet.bind: pass the Compose Roblox module from the same Compose copy as the second argument", 2)
	end
	local ThemesModuleResult = ThemesModule(Compose)
	local Callback = require("@self/ui/input_read")(Compose.isValue)
	local v2 = nil
	
	local function design()
		-- upvalues: v2 (ref), FreezeModule (upval)
		local v3 = v2
		
		if v3 == nil then
			local DesignModule = require("@self/design")
			local FreezeModuleResult = FreezeModule({
				Design = require("@self/vendor/compose/design"),
				library = DesignModule.library,
				controls = DesignModule.controls,
				seeds = DesignModule.seeds,
				motion = DesignModule.motion
			})
			v2 = FreezeModuleResult
			
			return FreezeModuleResult
		else
			return v3
		end
	end
	
	return (FreezeModule({
		VERSION = "0.12.0",
		COMPOSE_COMMIT = "90f0209e9e31d7bc04d090c8cdc8ffad2bcb7319",
		Compose = Compose,
		Roblox = Roblox,
		design = design,
		composeDesign = function(p1)
			-- upvalues: Roblox (copy), Compose (copy), UiModule (upval), design (copy), ThemesModuleResult (copy)
			local DesignEditorModule = require("@self/vendor/compose/design-editor")
			
			return require("@self/design/studio")(function(Entry)
				-- upvalues: Roblox (upval), Compose (upval), UiModule (upval), design (upval), p1 (copy), ThemesModuleResult (upval), DesignEditorModule (copy)
				local Runtime = Roblox.createRuntime()
				local Success, Result = pcall(function()
					-- upvalues: Runtime (copy), Entry (copy), Compose (upval), UiModule (upval), design (upval), p1 (upval), ThemesModuleResult (upval), Roblox (upval), DesignEditorModule (upval)
					local Constructors = Runtime.constructors
					local Choices = {}
					local t = {}
					
					for _, value in Entry do
						table.insert(Choices, value.name)
						t[value.name] = value
					end
					local CellResult = Compose.cell(Entry[1])
					local FormulaResult = Compose.formula(function(Callback)
						-- upvalues: CellResult (copy)
						return Callback(CellResult).theme
					end)
					local FormulaResult1 = Compose.formula(function(Callback)
						-- upvalues: CellResult (copy)
						return Callback(CellResult).palette
					end)
					local Medium = Compose.cell("Medium")
					local UiModuleResult = UiModule(Compose, Runtime, {
						theme = FormulaResult,
						environment = { preferredTextSize = Medium }
					})
					local DesignResult = design()
					
					return {
						root = "Screen",
						UI = UiModuleResult,
						runtime = Runtime,
						environment = Roblox.designEnvironment(),
						library = DesignResult.library({
							UI = UiModuleResult,
							designs = if p1 then p1.registry else nil,
							motion = DesignResult.motion(UiModuleResult),
							host = function(p2, p3, p4)
								-- upvalues: Runtime (upval)
								return Runtime.constructors[p2](p4, p3)
							end,
							provide = function(p2)
								-- upvalues: ThemesModuleResult (upval), Runtime (upval), FormulaResult (copy), FormulaResult1 (copy), Compose (upval), Constructors (copy)
								local StyleSheet = ThemesModuleResult.createStyleSheet(Runtime, FormulaResult, { theme = FormulaResult1 })
								
								return Constructors.Frame({
									Name = "FacetTheme",
									Size = UDim2.fromScale(1, 1),
									BackgroundTransparency = 1,
									StyleSheet,
									Constructors.StyleLink({ StyleSheet = Compose.static(StyleSheet) }),
									if typeof(p2) == "Instance" then p2 else nil
								})
							end
						}),
						devices = if p1 and p1.resolution then {
							DesignEditorModule.devices.custom("Canvas", p1.resolution)
						} elseif p1 then p1.stages else nil,
						previews = {
							{
								name = "Theme",
								choices = Choices,
								select = function(Text)
									-- upvalues: CellResult (copy), t (copy)
									CellResult:set(assert(t[Text], "Unknown workspace theme: " .. Text))
								end
							},
							{
								name = "Text size",
								choices = if p1 and p1.textSizes then p1.textSizes else { "Medium", "Large", "Larger", "Largest" },
								select = function(p2)
									-- upvalues: Medium (copy)
									Medium:set(p2)
								end
							}
						},
						dispose = function()
							-- upvalues: Runtime (upval)
							Runtime:dispose()
						end
					}
				end)
				
				if not Success then
					Runtime:dispose()
					error(Result, 0)
				end
				return Result
			end, p1, ThemesModuleResult.neutralPackage())
		end,
		tag = function(p2, Callback1)
			-- upvalues: StyleTagsModule (upval), Compose (copy), Callback (copy)
			if typeof(p2) == "Instance" then
				local t = {}
				
				local function _(p3)
					-- upvalues: t (ref), StyleTagsModule (upval), p2 (copy)
					t = StyleTagsModule(p2, p3, t)
				end
				
				if Compose.isValue(Callback1) or type(Callback1) == "function" then
					Compose.watch(function(p3)
						-- upvalues: Callback (upval), Callback1 (copy), t (ref), StyleTagsModule (upval), p2 (copy)
						t = StyleTagsModule(p2, Callback(Callback1, p3), t)
					end)
				else
					t = StyleTagsModule(p2, Callback(Callback1), t)
				end
			end
			return p2
		end,
		controls = function(p2, p3)
			-- upvalues: UiModule (upval), Compose (copy)
			return UiModule(Compose, p2, p3)
		end,
		host = function(p2)
			if type(p2) ~= "table" or type(p2.constructors) ~= "table" then
				error("Facet.host: pass a Compose runtime", 2)
			end
			return p2.constructors
		end,
		app = function(p2)
			-- upvalues: AppModule (upval), Compose (copy), Roblox (copy), UiModule (upval), ThemesModuleResult (copy)
			return AppModule(Compose, Roblox, UiModule, ThemesModuleResult, p2)
		end,
		themes = ThemesModuleResult,
		civilDate = CivilDateModule,
		adaptive = AdaptiveModule,
		gamepadContention = GamepadContentionModule,
		pathShapes = NavPathShapesModule,
		richText = RichTextModule,
		format = FormatModule,
		review = Frozen,
		recipes = FreezeModuleResult,
		inputPriority = Frozen1,
		bind = bind
	}))
end

return (bind(require("@self/vendor/compose/core"), (require("@self/vendor/compose/roblox"))))