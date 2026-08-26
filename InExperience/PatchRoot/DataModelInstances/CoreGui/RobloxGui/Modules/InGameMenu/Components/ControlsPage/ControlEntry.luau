local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local UIBlox = inGameMenuDependenciesModule.UIBlox
local parent = script.Parent.Parent.Parent
local globalConfigModule = require(parent.GlobalConfig)
local themedTextLabelModule = require(parent.Components.ThemedTextLabel)
local keyLabel = UIBlox.App.Menu.KeyLabel
local pointerLabelModule = require(parent.Components.PointerLabel)
local dividerModule = require(parent.Components.Divider)
local withLocalizationModule = require(parent.Localization.withLocalization)
local var1 = t.strictInterface({
	actionDescription = t.string,
	inputs = t.table,
	isList = t.optional(t.boolean),
	hasDivider = t.boolean,
	LayoutOrder = t.integer
})

local function renderHorizontalSpacer(p1, p2, p3)
	-- upvalues: roact (ref), themedTextLabelModule (ref)
	return roact.createElement(themedTextLabelModule, {
		themeKey = "TextEmphasis",
		fontKey = "Header1",
		Text = p1,
		Size = p3 and UDim2.new(0, 19, 0, 24) or UDim2.new(0, 19, 0, 16),
		TextYAlignment = p3 and Enum.TextYAlignment.Bottom,
		LayoutOrder = p2
	})
end

local function renderKey(p1, p2)
	-- upvalues: roact (ref), keyLabel (ref), pointerLabelModule (ref)
	return if p1.EnumType == Enum.KeyCode then roact.createElement(keyLabel, {
		textThemeKey = "TextEmphasis",
		keyCode = p1,
		LayoutOrder = p2
	}) else roact.createElement(pointerLabelModule, { input = p1, LayoutOrder = p2 })
end

local function renderInputIconContainer(p1, p2)
	-- upvalues: roact (ref), renderKey (ref), renderHorizontalSpacer (ref), themedTextLabelModule (ref)
	local t = {
		ListLayout = roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, if not p2 then 7 else 0)
		})
	}
	local var2 = 1
	
	for i, v in ipairs(p1) do
		if typeof(v) == "table" then
			for i_1, v_1 in ipairs(v) do
				local formattedText = string.format("%d_%d", i, i_1)
				t["groupedInput" .. formattedText] = renderKey(v_1, var2)
				var2 += 1
				
				if i_1 < #v then
					t["groupedDivider" .. formattedText] = roact.createElement(themedTextLabelModule, {
						themeKey = "TextEmphasis",
						fontKey = "Header1",
						Text = "+",
						TextYAlignment = nil,
						Size = UDim2.new(0, 19, 0, 16),
						LayoutOrder = var2
					})
					var2 += 1
				end
			end
		else
			t["input" .. i] = renderKey(v, var2)
			var2 += 1
			
			if p2 and i == #p1 then
				t.Elipses = renderHorizontalSpacer("...", var2, true)
			end
		end
		if not p2 and i < #p1 then
			t["divider" .. i] = roact.createElement(themedTextLabelModule, {
				themeKey = "TextEmphasis",
				fontKey = "Header1",
				Text = "/",
				TextYAlignment = nil,
				Size = UDim2.new(0, 19, 0, 16),
				LayoutOrder = var2
			})
			var2 += 1
		end
	end
	return roact.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 0, 1, 0),
		Position = UDim2.new(1, 0, 0, 0)
	}, t)
end

return function(p3)
	-- upvalues: globalConfigModule (ref), var1 (ref), withLocalizationModule (ref), roact (ref), themedTextLabelModule (ref), dividerModule (ref), renderInputIconContainer (ref)
	if globalConfigModule.propValidation then
		assert(var1(p3))
	end
	return withLocalizationModule({ actionDescription = p3.actionDescription })(function(p4)
		-- upvalues: roact (copy), p3 (ref), themedTextLabelModule (copy), dividerModule (copy), renderInputIconContainer (copy)
		return roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = p3.LayoutOrder,
			Size = UDim2.new(1, 0, 0, 50)
		}, {
			ActionLabel = roact.createElement(themedTextLabelModule, {
				fontKey = "Header2",
				themeKey = "TextEmphasis",
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(0, 200, 0, 22),
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 0, 0.5, 0),
				Text = p4.actionDescription
			}),
			Divider = p3.hasDivider and roact.createElement(dividerModule, {
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, 1, -1)
			}),
			Inputs = renderInputIconContainer(p3.inputs, p3.isList)
		})
	end)
end