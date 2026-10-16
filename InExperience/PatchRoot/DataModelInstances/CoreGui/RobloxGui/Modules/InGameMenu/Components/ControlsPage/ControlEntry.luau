local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent.Parent
local GlobalConfigModule = require(Parent.GlobalConfig)
local ThemedTextLabelModule = require(Parent.Components.ThemedTextLabel)
local KeyLabel = InGameMenuDependenciesModule.UIBlox.App.Menu.KeyLabel
local PointerLabelModule = require(Parent.Components.PointerLabel)
local DividerModule = require(Parent.Components.Divider)
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local StrictInterfaceResult = T.strictInterface({
	actionDescription = T.string,
	inputs = T.table,
	isList = T.optional(T.boolean),
	hasDivider = T.boolean,
	LayoutOrder = T.integer
})

local function renderHorizontalSpacer(Text, LayoutOrder, p1) --[[ Line: 30 ]]
	-- upvalues: Roact (copy), ThemedTextLabelModule (copy)
	return Roact.createElement(ThemedTextLabelModule, {
		themeKey = "TextEmphasis",
		fontKey = "Header1",
		Text = Text,
		Size = p1 and UDim2.new(0, 19, 0, 24) or UDim2.new(0, 19, 0, 16),
		TextYAlignment = p1 and Enum.TextYAlignment.Bottom,
		LayoutOrder = LayoutOrder
	})
end

local function renderKey(Input, LayoutOrder) --[[ Line: 44 ]]
	-- upvalues: Roact (copy), KeyLabel (copy), PointerLabelModule (copy)
	return if Input.EnumType == Enum.KeyCode then Roact.createElement(KeyLabel, {
		textThemeKey = "TextEmphasis",
		keyCode = Input,
		LayoutOrder = LayoutOrder
	}) else Roact.createElement(PointerLabelModule, { input = Input, LayoutOrder = LayoutOrder })
end

local function renderInputIconContainer(Inputs, IsList) --[[ Line: 60 ]]
	-- upvalues: Roact (copy), renderKey (copy), renderHorizontalSpacer (copy), ThemedTextLabelModule (copy)
	local Elements = {
		ListLayout = Roact.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Right,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, if IsList then 0 else 7)
		})
	}
	local LayoutOrder = 1
	
	for i, input in ipairs(Inputs) do
		if typeof(input) == "table" then
			for i1, value in ipairs(input) do
				local Formatted = string.format("%d_%d", i, i1)
				Elements["groupedInput" .. Formatted] = renderKey(value, LayoutOrder)
				LayoutOrder += 1
				
				if i1 < #input then
					Elements["groupedDivider" .. Formatted] = Roact.createElement(ThemedTextLabelModule, {
						themeKey = "TextEmphasis",
						fontKey = "Header1",
						Text = "+",
						TextYAlignment = nil,
						Size = UDim2.new(0, 19, 0, 16),
						LayoutOrder = LayoutOrder
					})
					LayoutOrder += 1
				end
			end
		else
			Elements["input" .. i] = renderKey(input, LayoutOrder)
			LayoutOrder += 1
			
			if IsList and i == #Inputs then
				Elements.Elipses = renderHorizontalSpacer("...", LayoutOrder, true)
			end
		end
		if not IsList and i < #Inputs then
			Elements["divider" .. i] = Roact.createElement(ThemedTextLabelModule, {
				themeKey = "TextEmphasis",
				fontKey = "Header1",
				Text = "/",
				TextYAlignment = nil,
				Size = UDim2.new(0, 19, 0, 16),
				LayoutOrder = LayoutOrder
			})
			LayoutOrder += 1
		end
	end
	return Roact.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 0, 1, 0),
		Position = UDim2.new(1, 0, 0, 0)
	}, Elements)
end

return function(Frame) --[[ Line: 115 | Named "ControlEntry" ]]
	-- upvalues: GlobalConfigModule (copy), StrictInterfaceResult (copy), WithLocalizationModule (copy), Roact (copy), ThemedTextLabelModule (copy), DividerModule (copy), renderInputIconContainer (copy)
	if GlobalConfigModule.propValidation then
		assert(StrictInterfaceResult(Frame))
	end
	return WithLocalizationModule({ actionDescription = Frame.actionDescription })(function(p1) --[[ Line: 122 ]]
		-- upvalues: Roact (upval), Frame (copy), ThemedTextLabelModule (upval), DividerModule (upval), renderInputIconContainer (upval)
		return Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = Frame.LayoutOrder,
			Size = UDim2.new(1, 0, 0, 50)
		}, {
			ActionLabel = Roact.createElement(ThemedTextLabelModule, {
				fontKey = "Header2",
				themeKey = "TextEmphasis",
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.new(0, 200, 0, 22),
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 0, 0.5, 0),
				Text = p1.actionDescription
			}),
			Divider = Frame.hasDivider and Roact.createElement(DividerModule, {
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0, 0, 1, -1)
			}),
			Inputs = renderInputIconContainer(Frame.inputs, Frame.isList)
		})
	end)
end