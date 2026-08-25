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
local var6 = t.strictInterface({
	actionDescription = t.string,
	inputs = t.table,
	isList = t.optional(t.boolean),
	hasDivider = t.boolean,
	LayoutOrder = t.integer
})

local function renderHorizontalSpacer(p0, p1, p2)
	-- upvalues: roact (ref), themedTextLabelModule (ref)
	return roact.createElement(themedTextLabelModule, {
		themeKey = "TextEmphasis",
		fontKey = "Header1",
		Text = p0,
		Size = p2 and UDim2.new(0, 19, 0, 24) or UDim2.new(0, 19, 0, 16),
		TextYAlignment = p2 and Enum.TextYAlignment.Bottom,
		LayoutOrder = p1
	})
end

local function renderKey(p3, p4)
	-- upvalues: roact (ref), keyLabel (ref), pointerLabelModule (ref)
	return if p3.EnumType == Enum.KeyCode then roact.createElement(keyLabel, {
		textThemeKey = "TextEmphasis",
		keyCode = p3,
		LayoutOrder = p4
	}) else roact.createElement(pointerLabelModule, { input = p3, LayoutOrder = p4 })
end

local function renderInputIconContainer(p5, p6)
	-- upvalues: roact (ref), renderKey (ref), renderHorizontalSpacer (ref), themedTextLabelModule (ref)
	local t = {
		ListLayout = roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, if not p6 then 7 else 0)
		})
	}
	local var11 = 1
	
	for i, v in ipairs(p5) do
		if typeof(v) == "table" then
			for i_1, v_1 in ipairs(v) do
				local formattedText = string.format("%d_%d", i, i_1)
				t["groupedInput" .. formattedText] = renderKey(v_1, var11)
				var11 += 1
				
				if i_1 < #v then
					t["groupedDivider" .. formattedText] = roact.createElement(themedTextLabelModule, {
						themeKey = "TextEmphasis",
						fontKey = "Header1",
						Text = "+",
						TextYAlignment = nil,
						Size = UDim2.new(0, 19, 0, 16),
						LayoutOrder = var11
					})
					var11 += 1
				end
			end
		else
			t["input" .. i] = renderKey(v, var11)
			var11 += 1
			
			if p6 and i == #p5 then
				t.Elipses = renderHorizontalSpacer("...", var11, true)
			end
		end
		if not p6 and i < #p5 then
			t["divider" .. i] = roact.createElement(themedTextLabelModule, {
				themeKey = "TextEmphasis",
				fontKey = "Header1",
				Text = "/",
				TextYAlignment = nil,
				Size = UDim2.new(0, 19, 0, 16),
				LayoutOrder = var11
			})
			var11 += 1
		end
	end
	return roact.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 0, 1, 0),
		Position = UDim2.new(1, 0, 0, 0)
	}, t)
end

return function(p7)
	-- upvalues: globalConfigModule (ref), var6 (ref), withLocalizationModule (ref), roact (ref), themedTextLabelModule (ref), dividerModule (ref), renderInputIconContainer (ref)
	if globalConfigModule.propValidation then
		assert(var6(p7))
	end
	return withLocalizationModule({ actionDescription = p7.actionDescription })(function(p8)
		-- upvalues: roact (copy), p7 (ref), themedTextLabelModule (copy), dividerModule (copy), renderInputIconContainer (copy)
		return roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = p7.LayoutOrder,
			Size = UDim2.new(1, 0, 0, 50)
		}, {
			ActionLabel = roact.createElement(themedTextLabelModule, {
				fontKey = "Header2",
				themeKey = "TextEmphasis",
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(0, 200, 0, 22),
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 0, 0.5, 0),
				Text = p8.actionDescription
			}),
			Divider = p7.hasDivider and roact.createElement(dividerModule, {
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, 1, -1)
			}),
			Inputs = renderInputIconContainer(p7.inputs, p7.isList)
		})
	end)
end