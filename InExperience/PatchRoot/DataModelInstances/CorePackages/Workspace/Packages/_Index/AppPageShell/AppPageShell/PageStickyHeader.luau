local appPageShell = script:FindFirstAncestor("AppPageShell")
local parent = appPageShell.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local _ = require(appPageShell.PageTypes)
local computeStickyOffsetModule = require(appPageShell.computeStickyOffset)
local view = foundationModule.View
local useDeviceInsets = responsiveModule.useDeviceInsets
local useTokens = foundationModule.Hooks.useTokens

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), useDeviceInsets (ref), computeStickyOffsetModule (ref), view (ref)
	local topPadding = p1.topPadding
	local backgroundStyle = p1.backgroundStyle
	local slots = p1.slots
	local chromeHeight = p1.chromeHeight or 0
	local liveChromeHeightBinding = p1.liveChromeHeightBinding
	local var1 = useTokens()
	local var2, var3 = reactModule.useBinding(0)
	local top = useDeviceInsets().top
	local var4 = reactModule.useMemo(function()
		-- upvalues: slots (ref)
		if slots == nil or next(slots) == nil then
			return nil
		end
		local t = {}
		
		for i, v in slots do
			t[`Sticky{i}`] = v
		end
		return t
	end, { slots })
	
	return if var4 == nil then nil else reactModule.createElement(view, {
		LayoutOrder = 1,
		ZIndex = 2,
		ClipsDescendants = false,
		Size = reactModule.useMemo(function()
			-- upvalues: var2 (ref)
			return var2:map(function(p2)
				return UDim2.new(1, 0, 0, p2)
			end)
		end, { var2 })
	}, {
		Translation = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = reactModule.useMemo(function()
				-- upvalues: liveChromeHeightBinding (ref), chromeHeight (ref), computeStickyOffsetModule (copy), top (ref)
				return if liveChromeHeightBinding == nil or chromeHeight <= 0 then UDim2.fromOffset(0, 0) else liveChromeHeightBinding:map(function(p2)
					-- upvalues: computeStickyOffsetModule (copy), chromeHeight (copy), top (copy)
					return UDim2.fromOffset(0, computeStickyOffsetModule(p2, chromeHeight, top))
				end)
			end, { liveChromeHeightBinding, chromeHeight, top }),
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			ClipsDescendants = false,
			[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p2)
				-- upvalues: var3 (ref)
				var3(p2.AbsoluteSize.Y)
			end, {})
		}, {
			Background = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 0,
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				Size = reactModule.useMemo(function()
					-- upvalues: var2 (ref), chromeHeight (ref)
					return var2:map(function(p2)
						-- upvalues: chromeHeight (copy)
						return UDim2.new(1, 0, 0, p2 + chromeHeight)
					end)
				end, { var2, chromeHeight }),
				BackgroundColor3 = if backgroundStyle then backgroundStyle.Color3 else var1.Color.Surface.Surface_0.Color3,
				BackgroundTransparency = if backgroundStyle and backgroundStyle.Transparency ~= nil then backgroundStyle.Transparency else 0
			}),
			Content = reactModule.createElement(view, { tag = `col size-full-0 auto-y {p1.tag or ""}` }, {
				TopSpacer = if topPadding and topPadding > 0 then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, topPadding)
				}) else nil,
				Body = reactModule.createElement(view, { tag = "col size-full-0 auto-y", LayoutOrder = 2 }, var4)
			})
		})
	})
end)