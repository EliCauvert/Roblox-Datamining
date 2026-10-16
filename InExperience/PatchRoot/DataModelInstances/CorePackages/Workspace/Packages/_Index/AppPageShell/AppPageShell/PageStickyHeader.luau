local AppPageShell = script:FindFirstAncestor("AppPageShell")
local Parent = AppPageShell.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(AppPageShell.PageTypes)
local ComputeStickyOffsetModule = require(AppPageShell.computeStickyOffset)
local View = FoundationModule.View
local UseDeviceInsetsFunction = require(Parent.Responsive).useDeviceInsets
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagSduiFeedScrollBarFixes = require(Parent.SharedFlags).FFlagSduiFeedScrollBarFixes

return ReactModule.memo(function(p1) --[[ Line: 34 | Named "PageStickyHeader" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FFlagSduiFeedScrollBarFixes (copy), UseDeviceInsetsFunction (copy), ComputeStickyOffsetModule (copy), View (copy)
	local TopPadding: number = p1.topPadding
	local BackgroundStyle = p1.backgroundStyle
	local Slots = p1.slots
	local ChromeHeight = p1.chromeHeight or 0
	local LiveChromeHeightBinding = p1.liveChromeHeightBinding
	local UseTokensResult = UseTokensFunction()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseMemoResult = nil
	
	if not FFlagSduiFeedScrollBarFixes then
		local Top = UseDeviceInsetsFunction().top
		UseMemoResult = ReactModule.useMemo(function() --[[ Line: 49 ]]
			-- upvalues: LiveChromeHeightBinding (copy), ChromeHeight (copy), ComputeStickyOffsetModule (upval), Top (copy)
			return if LiveChromeHeightBinding == nil or ChromeHeight <= 0 then UDim2.fromOffset(0, 0) else LiveChromeHeightBinding:map(function(p2): UDim2 --[[ Line: 53 ]]
				-- upvalues: ComputeStickyOffsetModule (upval), ChromeHeight (upval), Top (upval)
				return UDim2.fromOffset(0, ComputeStickyOffsetModule(p2, ChromeHeight, Top))
			end)
		end, { LiveChromeHeightBinding, ChromeHeight, Top })
	end
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 62 ]]
		-- upvalues: UseBindingResult (copy), ChromeHeight (copy)
		return UseBindingResult:map(function(p2): UDim2 --[[ Line: 63 ]]
			-- upvalues: ChromeHeight (upval)
			return UDim2.new(1, 0, 0, p2 + ChromeHeight)
		end)
	end, { UseBindingResult, ChromeHeight })
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 68 ]]
		-- upvalues: Slots (copy)
		if Slots == nil or next(Slots) == nil then
			return nil
		end
		local t = {}
		
		for i, slot in Slots do
			t[`Sticky{i}`] = slot
		end
		return t
	end, { Slots })
	local UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 79 ]]
		-- upvalues: UseBindingResult (copy)
		return UseBindingResult:map(function(YOffset): UDim2 --[[ Line: 80 ]]
			return UDim2.new(1, 0, 0, YOffset)
		end)
	end, { UseBindingResult })
	local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 85 ]]
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(Frame.AbsoluteSize.Y)
	end, {})
	
	return if UseMemoResult2 == nil then nil else ReactModule.createElement(View, {
		LayoutOrder = 1,
		ZIndex = 2,
		ClipsDescendants = false,
		Size = UseMemoResult3
	}, {
		Translation = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = if FFlagSduiFeedScrollBarFixes then nil else UseMemoResult,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			ClipsDescendants = false,
			[ReactModule.Change.AbsoluteSize] = UseResult
		}, {
			Background = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 0,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				Size = UseMemoResult1,
				BackgroundColor3 = if BackgroundStyle then BackgroundStyle.Color3 else UseTokensResult.Color.Surface.Surface_0.Color3,
				BackgroundTransparency = if BackgroundStyle and BackgroundStyle.Transparency ~= nil then BackgroundStyle.Transparency else 0
			}),
			Content = ReactModule.createElement(View, { tag = `col size-full-0 auto-y {p1.tag or ""}` }, {
				TopSpacer = if TopPadding and TopPadding > 0 then ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, TopPadding)
				}) else nil,
				Body = ReactModule.createElement(View, { tag = "col size-full-0 auto-y", LayoutOrder = 2 }, UseMemoResult2)
			})
		})
	})
end)