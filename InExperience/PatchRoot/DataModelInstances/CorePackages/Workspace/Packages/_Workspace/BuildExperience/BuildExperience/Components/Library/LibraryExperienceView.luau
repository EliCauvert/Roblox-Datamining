local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local MotionModule = require(Parent.Motion)
local IconButton = FoundationModule.IconButton
local SegmentedControl = FoundationModule.SegmentedControl
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local SearchBarContainerModule = require(BuildExperience.Components.SearchBar.SearchBarContainer)
local LibraryWorldBackdropViewModule = require(script.Parent.LibraryWorldCutout.LibraryWorldBackdropView)
local _ = require(script.Parent.LibraryWorldCutout.useLibraryWorldCutoutViewModel)
local ReleaseFocusWithinModule = require(BuildExperience.utils.releaseFocusWithin)
local UseTypedQueryBindingModule = require(script.Parent.useTypedQueryBinding)
local UseHardwareInsetsModule = require(BuildExperience.Components.ChatSheet.useHardwareInsets)
local config = {
	Top = {
		UDim2.fromOffset(-10000, -10000),
		UDim2.new(1, 20000, 0, 10000)
	},
	Bottom = {
		UDim2.new(0, -10000, 1, 0),
		UDim2.new(1, 20000, 0, 10000)
	},
	Left = { UDim2.fromOffset(-10000, 0), UDim2.new(0, 10000, 1, 0) },
	Right = { UDim2.fromScale(1, 0), UDim2.new(0, 10000, 1, 0) }
}

return function(p1)
	-- upvalues: FoundationModule (copy), UseHardwareInsetsModule (copy), ReactModule (copy), MotionModule (copy), ReleaseFocusWithinModule (copy), UseTypedQueryBindingModule (copy), config (copy), View (copy), IconButton (copy), IconName (copy), InputSize (copy), ButtonVariant (copy), Text (copy), SearchBarContainerModule (copy), SegmentedControl (copy), LibraryWorldBackdropViewModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local ReducedMotion = FoundationModule.Hooks.usePreferences().reducedMotion
	local Bottom = UseHardwareInsetsModule().bottom
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.isOpen)
	local UseMotionResult, UseMotionResult2 = MotionModule.useMotion({ transparency = if p1.isOpen then 0 else 1 })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy), UseMotionResult2 (copy), MotionModule (upval), ReducedMotion (copy)
		local Flag = false
		
		if p1.isOpen then
			UseStateResult2(true)
		end
		UseMotionResult2(MotionModule.createState({ transparency = if p1.isOpen then 0 else 1 }, {
			default = MotionModule.transition({
				duration = if ReducedMotion or not p1.showModeControl then 0 else 0.15,
				easingStyle = Enum.EasingStyle.Quad
			})
		}), {
			onAnimationComplete = function(p2)
				-- upvalues: Flag (ref), p1 (upval), UseStateResult2 (upval)
				if p2 and not Flag and not p1.isOpen then
					UseStateResult2(false)
				end
			end
		})
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, {
		p1.isOpen,
		p1.showModeControl,
		ReducedMotion,
		UseMotionResult2
	})
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), p1 (copy)
		local Current = UseRefResult.current
		
		if Current == nil or p1.isWorldAvailable ~= false then
			return nil
		end
		local Selectables = { [Current] = Current.Selectable }
		local TextTransparencies = {}
		
		for _, descendant in Current:GetDescendants() do
			if descendant:IsA("GuiButton") then
				Selectables[descendant] = descendant.Selectable
			elseif descendant:IsA("TextLabel") then
				TextTransparencies[descendant] = descendant.TextTransparency
			end
		end
		for selectable in Selectables do
			selectable.Selectable = false
		end
		for Label, textTransparency in TextTransparencies do
			Label.TextTransparency = 1 - (1 - textTransparency) * 0.5
		end
		return function()
			-- upvalues: Selectables (copy), TextTransparencies (copy)
			for i, selectable in Selectables do
				i.Selectable = selectable
			end
			for Label, textTransparency in TextTransparencies do
				Label.TextTransparency = textTransparency
			end
		end
	end, { p1.isWorldAvailable, p1.showModeControl })
	local WorldCutout = p1.worldCutout
	local IsTransitioning = WorldCutout ~= nil and WorldCutout.isTransitioning
	local Transparency = if WorldCutout == nil or not IsTransitioning then UseMotionResult.transparency else WorldCutout.progress
	local IsOpen = p1.isOpen or (UseStateResult or IsTransitioning)
	local MapResult = Transparency:map(function(Transparency)
		-- upvalues: UseTokensResult (copy)
		return {
			Color3 = UseTokensResult.Color.Surface.Surface_0.Color3,
			Transparency = Transparency
		}
	end)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local HasQuery: boolean = p1.isOpen and (p1.onQueryChanged ~= nil and p1.query ~= nil)
	local OnBack = p1.onBack
	local Title = p1.title or p1.assetLabel
	local IsUseStateResultMatch = UseStateResult1 == Title
	local IsUseStateResultMatch1: boolean = HasQuery and (IsUseStateResultMatch or p1.query ~= "")
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(nil)
	end, { p1.title, p1.isOpen })
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	
	local function v41(p2): boolean
		-- upvalues: UseRefResult2 (copy)
		local Current = UseRefResult2.current
		
		if p2 == nil or Current == nil then
			return false
		else
			local VectorDelta = Vector2.new(p2.Position.X, p2.Position.Y) - Current.AbsolutePosition
			
			return VectorDelta.X >= 0 and (VectorDelta.Y >= 0 and VectorDelta.X <= Current.AbsoluteSize.X) and VectorDelta.Y <= Current.AbsoluteSize.Y
		end
	end
	
	local function _()
		-- upvalues: ReleaseFocusWithinModule (upval), UseRefResult1 (copy)
		ReleaseFocusWithinModule(UseRefResult1.current)
	end
	
	local UseTypedQueryBindingModuleResult, UseTypedQueryBindingModuleResult2 = UseTypedQueryBindingModule(p1.query)
	
	local _ = function()
		-- upvalues: UseTypedQueryBindingModuleResult2 (copy), p1 (copy)
		UseTypedQueryBindingModuleResult2("")
		
		if p1.onSearchReset == nil then
			p1.onQueryChanged("")
			
			return
		else
			p1.onSearchReset()
		end
	end
	
	local Elements = {}
	
	for i, value in config do
		Elements[i] = ReactModule.createElement(View, {
			Position = value[1],
			Size = value[2],
			backgroundStyle = MapResult,
			testId = `Library.Experience.SafeAreaFill.{i}`
		})
	end
	return ReactModule.createElement(View, {
		tag = "col",
		testId = "Library.Experience",
		Size = UDim2.new(1, 0, 1, Bottom),
		backgroundStyle = { Transparency = 1 }
	}, {
		SafeAreaFill = ReactModule.createElement("Folder", nil, Elements),
		Header = ReactModule.createElement(View, {
			LayoutOrder = 1,
			testId = "Library.Experience.Header",
			backgroundStyle = MapResult,
			onActivated = function() end,
			selection = { Selectable = false },
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			},
			tag = {
				["row align-y-center gap-small size-full-0 auto-y padding-x-medium padding-top-xxlarge"] = true,
				["padding-bottom-small"] = p1.showModeControl == true,
				["padding-bottom-medium"] = p1.showModeControl ~= true
			},
			ref = UseRefResult1
		}, {
			Leading = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "auto-xy radius-circle",
				testId = "Library.Experience.LeadingChip",
				backgroundStyle = if p1.isOpen then nil else UseTokensResult.Color.OverMedia.OverMedia_0
			}, {
				Button = ReactModule.createElement(IconButton, {
					isCircular = true,
					icon = if OnBack == nil then IconName.X else IconName.ChevronLargeLeft,
					ref = UseRefResult2,
					onActivated = function()
						-- upvalues: OnBack (copy), p1 (copy), ReleaseFocusWithinModule (upval), UseRefResult1 (copy), UseStateResult2_1 (copy), IsUseStateResultMatch1 (copy), UseTypedQueryBindingModuleResult2 (copy)
						local OnBack1: () -> () = OnBack or p1.onLeave
						ReleaseFocusWithinModule(UseRefResult1.current)
						UseStateResult2_1(nil)
						
						if not IsUseStateResultMatch1 or OnBack ~= nil then
							OnBack1()
							
							return
						end
						UseTypedQueryBindingModuleResult2("")
						
						if p1.onSearchReset == nil then
							p1.onQueryChanged("")
							
							return
						else
							p1.onSearchReset()
						end
					end,
					size = InputSize.Large,
					variant = ButtonVariant.Utility,
					testId = if OnBack == nil then "Library.Experience.Leave" else "Library.Experience.Back"
				})
			}),
			Title = if IsUseStateResultMatch1 then ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "grow auto-y",
				testId = "Library.Experience.Search"
			}, {
				Input = ReactModule.createElement(SearchBarContainerModule, {
					key = Title,
					query = UseTypedQueryBindingModuleResult,
					placeholder = p1.searchPlaceholder,
					setQuery = function(p2)
						-- upvalues: UseTypedQueryBindingModuleResult2 (copy), p1 (copy)
						UseTypedQueryBindingModuleResult2(p2)
						p1.onQueryChanged(p2)
					end,
					clear = function()
						-- upvalues: ReleaseFocusWithinModule (upval), UseRefResult1 (copy), UseTypedQueryBindingModuleResult2 (copy), p1 (copy)
						ReleaseFocusWithinModule(UseRefResult1.current)
						UseTypedQueryBindingModuleResult2("")
						
						if p1.onSearchReset == nil then
							p1.onQueryChanged("")
							
							return
						else
							p1.onSearchReset()
						end
					end,
					onDismiss = function()
						-- upvalues: ReleaseFocusWithinModule (upval), UseRefResult1 (copy), UseStateResult2_1 (copy)
						ReleaseFocusWithinModule(UseRefResult1.current)
						UseStateResult2_1(nil)
					end,
					onFocusLost = function(p2)
						-- upvalues: UseTypedQueryBindingModuleResult (copy), v41 (copy), UseStateResult2_1 (copy)
						if UseTypedQueryBindingModuleResult:getValue() == "" and not v41(p2) then
							UseStateResult2_1(nil)
						end
					end,
					shouldFocus = IsUseStateResultMatch
				})
			}) else ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "fill text-heading-small text-align-x-left text-truncate-end content-emphasis",
				testId = "Library.Experience.Title",
				Text = Title
			}),
			Search = if HasQuery and not IsUseStateResultMatch1 then ReactModule.createElement(IconButton, {
				LayoutOrder = 3,
				testId = "Library.Experience.Search.Action",
				icon = IconName.MagnifyingGlass,
				onActivated = function()
					-- upvalues: UseStateResult2_1 (copy), Title (copy)
					UseStateResult2_1(Title)
				end,
				size = InputSize.Large,
				variant = ButtonVariant.Utility
			}) else nil
		}),
		ModeRow = if p1.showModeControl then ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "row align-x-center size-full-0 auto-y padding-x-medium padding-bottom-medium",
			testId = "Library.Experience.ModeRow",
			backgroundStyle = MapResult
		}, {
			Control = ReactModule.createElement(SegmentedControl, {
				isCircular = true,
				testId = "Library.Experience.Mode",
				segments = {
					{ id = "Library", text = p1.assetLabel },
					{ id = "World", text = p1.worldLabel, ref = UseRefResult }
				},
				value = if p1.isOpen then "Library" else "World",
				onActivated = function(p2)
					-- upvalues: p1 (copy)
					if p2 == "Library" then
						p1.onShowLibrary()
						
						return
					end
					if p2 == "World" then
						p1.onShowWorld()
					end
				end,
				size = InputSize.Medium
			})
		}) else nil,
		Content = ReactModule.createElement(View, {
			LayoutOrder = 3,
			tag = "fill size-full-0 clip",
			testId = "Library.Experience.Content",
			ref = if WorldCutout == nil then nil else WorldCutout.onContentRectChanged,
			onAbsolutePositionChanged = if WorldCutout == nil then nil else WorldCutout.onContentRectChanged,
			onAbsoluteSizeChanged = if WorldCutout == nil then nil else WorldCutout.onContentRectChanged
		}, {
			Backdrop = if WorldCutout == nil then nil else ReactModule.createElement(LibraryWorldBackdropViewModule, {
				ZIndex = 1,
				hole = if WorldCutout.showHole then WorldCutout.hole else nil,
				progress = WorldCutout.progress,
				cornerRadius = UseTokensResult.Radius.Medium,
				color = UseTokensResult.Color.Surface.Surface_0.Color3,
				transparency = if IsTransitioning then WorldCutout.progress:map(function(): number
					return 0
				end) else UseMotionResult.transparency,
				Visible = IsOpen
			}),
			Body = ReactModule.createElement(View, {
				ZIndex = 2,
				testId = "Library.Experience.Body",
				Visible = IsOpen,
				GroupTransparency = Transparency,
				backgroundStyle = if WorldCutout == nil then nil else { Transparency = 1 },
				tag = {
					["size-full clip"] = true,
					["bg-surface-0"] = WorldCutout == nil
				}
			}, p1.children),
			WorldViewport = if p1.isOpen or IsTransitioning or p1.onWorldViewportChanged == nil then nil else ReactModule.createElement(View, {
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