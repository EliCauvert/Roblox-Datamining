local Parent = script.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local SignalsReactModule = require(Parent1.SignalsReact)
local GetThemeBackgroundStoreModule = require(Parent.Stores.GetThemeBackgroundStore)
local ThemeBackgroundImageModule = require(Parent.ThemeBackgroundImage)
local _ = require(Parent.ThemeBackgroundTypes)

return function(p1)
	-- upvalues: SignalsReactModule (copy), GetThemeBackgroundStoreModule (copy), ReactModule (copy), ThemeBackgroundImageModule (copy)
	local UseSignalBindingResult = SignalsReactModule.useSignalBinding(GetThemeBackgroundStoreModule(false).getGeometry)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.zero)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseBindingResult2 (copy)
		if Frame then
			UseBindingResult2(Frame.AbsolutePosition)
		end
	end, {})
	
	return ReactModule.createElement("Frame", {
		BackgroundColor3 = p1.baseColor,
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.fromScale(1, 1),
		ZIndex = -1,
		ref = UseResult,
		[ReactModule.Change.AbsolutePosition] = UseResult
	}, {
		Image = ReactModule.createElement(ThemeBackgroundImageModule, {
			image = p1.image,
			Position = ReactModule.useMemo(function()
				-- upvalues: ReactModule (upval), UseSignalBindingResult (copy), UseBindingResult (copy)
				return ReactModule.joinBindings({ UseSignalBindingResult, UseBindingResult }):map(function(Entry): UDim2
					local PositionDelta = Entry[1].position - Entry[2]
					
					return UDim2.fromOffset(PositionDelta.X, PositionDelta.Y)
				end)
			end, { UseSignalBindingResult }),
			Size = ReactModule.useMemo(function()
				-- upvalues: UseSignalBindingResult (copy)
				return UseSignalBindingResult:map(function(p2): UDim2
					return UDim2.fromOffset(p2.size.X, p2.size.Y)
				end)
			end, { UseSignalBindingResult })
		})
	})
end