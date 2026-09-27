local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local motionModule = require(parent.Motion)
local iconButton = foundationModule.IconButton
local segmentedControl = foundationModule.SegmentedControl
local text = foundationModule.Text
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize
local searchBarContainerModule = require(buildExperience.Components.SearchBar.SearchBarContainer)
local libraryWorldBackdropViewModule = require(script.Parent.LibraryWorldCutout.LibraryWorldBackdropView)
local _ = require(script.Parent.LibraryWorldCutout.useLibraryWorldCutoutViewModel)
local releaseFocusWithinModule = require(buildExperience.utils.releaseFocusWithin)
local useTypedQueryBindingModule = require(script.Parent.useTypedQueryBinding)

return function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), motionModule (ref), releaseFocusWithinModule (ref), useTypedQueryBindingModule (ref), view (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref), text (ref), searchBarContainerModule (ref), segmentedControl (ref), libraryWorldBackdropViewModule (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local reducedMotion = foundationModule.Hooks.usePreferences().reducedMotion
	local var2, var3 = reactModule.useState(p1.isOpen)
	local var4, var5 = motionModule.useMotion({ transparency = if p1.isOpen then 0 else 1 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), var5 (ref), motionModule (copy), reducedMotion (ref)
		local var6 = false
		
		if p1.isOpen then
			var3(true)
		end
		var5(motionModule.createState({ transparency = if p1.isOpen then 0 else 1 }, {
			default = motionModule.transition({
				duration = if reducedMotion or not p1.showModeControl then 0 else 0.15,
				easingStyle = Enum.EasingStyle.Quad
			})
		}), {
			onAnimationComplete = function(p2)
				-- upvalues: var6 (write), p1 (copy), var3 (copy)
				if p2 and not var6 and not p1.isOpen then
					var3(false)
				end
			end
		})
		
		return function()
			-- upvalues: var6 (write)
			var6 = true
		end
	end, { p1.isOpen, p1.showModeControl, reducedMotion, var5 })
	local var6 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), p1 (ref)
		local current = var6.current
		
		if current == nil or p1.isWorldAvailable ~= false then
			return nil
		end
		local t = { [current] = current.Selectable }
		local t_1 = {}
		
		for i, v in current:GetDescendants() do
			if v:IsA("GuiButton") then
				t[v] = v.Selectable
			elseif v:IsA("TextLabel") then
				t_1[v] = v.TextTransparency
			end
		end
		for i_1 in t do
			i_1.Selectable = false
		end
		for i_2, v_1 in t_1 do
			i_2.TextTransparency = 1 - (1 - v_1) * 0.5
		end
		return function()
			-- upvalues: t (ref), t_1 (ref)
			for i, v in t do
				i.Selectable = v
			end
			for i_1, v_1 in t_1 do
				i_1.TextTransparency = v_1
			end
		end
	end, { p1.isWorldAvailable, p1.showModeControl })
	local worldCutout = p1.worldCutout
	local var7 = worldCutout ~= nil and worldCutout.isTransitioning
	local var8 = if worldCutout == nil or not var7 then var4.transparency else worldCutout.progress
	local isOpen = p1.isOpen or (var2 or var7)
	local var9 = var8:map(function(p2)
		-- upvalues: var1 (ref)
		return {
			Color3 = var1.Color.Surface.Surface_0.Color3,
			Transparency = p2
		}
	end)
	local var10, var11 = reactModule.useState(nil)
	local var12 = p1.isOpen and (p1.onQueryChanged ~= nil and p1.query ~= nil)
	local onBack = p1.onBack
	local title = p1.title or p1.assetLabel
	local var13 = var10 == title
	local var14 = var12 and (var13 or p1.query ~= "")
	reactModule.useEffect(function()
		-- upvalues: var11 (ref)
		var11(nil)
	end, { p1.title, p1.isOpen })
	local var15 = reactModule.useRef(nil)
	
	local _ = function()
		-- upvalues: releaseFocusWithinModule (copy), var15 (ref)
		releaseFocusWithinModule(var15.current)
	end
	
	local var16, var17 = useTypedQueryBindingModule(p1.query)
	
	return reactModule.createElement(view, {
		tag = "col size-full",
		testId = "Library.Experience",
		backgroundStyle = { Transparency = 1 }
	}, {
		Header = reactModule.createElement(view, {
			LayoutOrder = 1,
			testId = "Library.Experience.Header",
			backgroundStyle = var9,
			onActivated = function() end,
			selection = { Selectable = false },
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			tag = {
				["row align-y-center gap-small size-full-0 auto-y padding-x-medium padding-top-xxlarge"] = true,
				["padding-bottom-small"] = p1.showModeControl == true,
				["padding-bottom-medium"] = p1.showModeControl ~= true
			},
			ref = var15
		}, {
			Leading = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				isCircular = true,
				icon = if onBack ~= nil then iconName.X else iconName.ChevronLargeLeft,
				onActivated = function()
					-- upvalues: onBack (ref), p1 (ref), releaseFocusWithinModule (copy), var15 (ref), var11 (ref)
					local onBack_1 = onBack or p1.onLeave
					releaseFocusWithinModule(var15.current)
					var11(nil)
					onBack_1()
				end,
				size = inputSize.Large,
				variant = buttonVariant.Utility,
				testId = if onBack ~= nil then "Library.Experience.Leave" else "Library.Experience.Back"
			}),
			Title = if not var14 then reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "fill text-heading-small text-align-x-left text-truncate-end content-emphasis",
				testId = "Library.Experience.Title",
				Text = title
			}) else reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "grow auto-y",
				testId = "Library.Experience.Search"
			}, {
				Input = reactModule.createElement(searchBarContainerModule, {
					key = title,
					query = var16,
					placeholder = p1.searchPlaceholder,
					setQuery = function(value)
						-- upvalues: var17 (ref), p1 (ref)
						var17(value)
						p1.onQueryChanged(value)
					end,
					clear = function()
						-- upvalues: releaseFocusWithinModule (copy), var15 (ref), var17 (ref), p1 (ref)
						releaseFocusWithinModule(var15.current)
						var17("")
						
						if p1.onSearchReset == nil then
							p1.onQueryChanged("")
							
							return
						end
						p1.onSearchReset()
					end,
					onDismiss = function()
						-- upvalues: releaseFocusWithinModule (copy), var15 (ref), var11 (ref)
						releaseFocusWithinModule(var15.current)
						var11(nil)
					end,
					shouldFocus = var13
				})
			}),
			Search = if var12 and not var14 then reactModule.createElement(iconButton, {
				LayoutOrder = 3,
				testId = "Library.Experience.Search.Action",
				icon = iconName.MagnifyingGlass,
				onActivated = function()
					-- upvalues: var11 (ref), title (ref)
					var11(title)
				end,
				size = inputSize.Large,
				variant = buttonVariant.Utility
			}) else nil
		}),
		ModeRow = if p1.showModeControl then reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = "row align-x-center size-full-0 auto-y padding-x-medium padding-bottom-medium",
			testId = "Library.Experience.ModeRow",
			backgroundStyle = var9
		}, {
			Control = reactModule.createElement(segmentedControl, {
				isCircular = true,
				testId = "Library.Experience.Mode",
				segments = {
					{ id = "Library", text = p1.assetLabel },
					{ id = "World", text = p1.worldLabel, ref = var6 }
				},
				value = if p1.isOpen then "Library" else "World",
				onActivated = function(p2)
					-- upvalues: p1 (ref)
					if p2 == "Library" then
						p1.onShowLibrary()
						
						return
					elseif p2 == "World" then
						p1.onShowWorld()
					end
				end,
				size = inputSize.Medium
			})
		}) else nil,
		Content = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "fill size-full-0 clip",
			testId = "Library.Experience.Content",
			ref = if worldCutout ~= nil then nil else worldCutout.onContentRectChanged,
			onAbsolutePositionChanged = if worldCutout ~= nil then nil else worldCutout.onContentRectChanged,
			onAbsoluteSizeChanged = if worldCutout ~= nil then nil else worldCutout.onContentRectChanged
		}, {
			Backdrop = if worldCutout ~= nil then nil else reactModule.createElement(libraryWorldBackdropViewModule, {
				ZIndex = 1,
				hole = if worldCutout.showHole then worldCutout.hole else nil,
				progress = worldCutout.progress,
				cornerRadius = var1.Radius.Medium,
				color = var1.Color.Surface.Surface_0.Color3,
				transparency = if var7 then worldCutout.progress:map(function()
					return 0
				end) else var4.transparency,
				Visible = isOpen
			}),
			Body = reactModule.createElement(view, {
				ZIndex = 2,
				testId = "Library.Experience.Body",
				Visible = isOpen,
				GroupTransparency = var8,
				backgroundStyle = if worldCutout ~= nil then nil else { Transparency = 1 },
				tag = {
					["size-full clip"] = true,
					["bg-surface-0"] = worldCutout == nil
				}
			}, p1.children),
			WorldViewport = if p1.isOpen or var7 or p1.onWorldViewportChanged == nil then nil else reactModule.createElement(view, {
				ZIndex = 3,
				tag = "size-full",
				testId = "Library.Experience.WorldViewport",
				ref = p1.onWorldViewportChanged,
				onAbsolutePositionChanged = p1.onWorldViewportChanged,
				onAbsoluteSizeChanged = p1.onWorldViewportChanged,
				backgroundStyle = { Transparency = 1 }
			})
		})
	})
end