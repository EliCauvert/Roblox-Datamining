local editProfileBackground = script:FindFirstAncestor("EditProfileBackground")
local parent = editProfileBackground.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local profileBackgroundButtonModule = require(editProfileBackground.Components.ProfileBackgroundButton)
local constantsModule = require(editProfileBackground.Common.Constants)

return function(p1)
	-- upvalues: reactModule (ref), constantsModule (ref), profileBackgroundButtonModule (ref), view (ref)
	local var1, var2 = reactModule.useState(p1.currentBackgroundId or constantsModule.BACKGROUND_ASSET_IDS[1])
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref)
		if p1.currentBackgroundId then
			var2(p1.currentBackgroundId)
		end
	end, { p1.currentBackgroundId })
	local BACKGROUND_ASSET_IDS = constantsModule.BACKGROUND_ASSET_IDS
	local buttonsPerRow = p1.buttonsPerRow
	local numRows = p1.numRows
	local buttonSize = p1.buttonSize
	local var3 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), p1 (ref)
		var2(p2)
		task.delay(0.1, function()
			-- upvalues: p1 (copy), p2 (ref)
			if p1.onBackgroundSelected then
				p1.onBackgroundSelected(p2)
			end
		end)
	end, { p1.onBackgroundSelected })
	
	local function renderRow(p2, p3, p4)
		-- upvalues: reactModule (copy), BACKGROUND_ASSET_IDS (ref), var1 (ref), profileBackgroundButtonModule (copy), var3 (ref), buttonSize (ref), view (copy), buttonSize (ref)
		local t = {}
		table.insert(t, reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 16)
		}))
		table.insert(t, reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 0),
			PaddingRight = UDim.new(0, 0)
		}))
		
		for i = p3, p3 + p4 - 1 do
			local var4 = BACKGROUND_ASSET_IDS[i]
			table.insert(t, reactModule.createElement(profileBackgroundButtonModule, {
				LayoutOrder = i,
				profileBackgroundId = var4,
				selected = var1 == var4,
				onActivated = var3,
				buttonSize = buttonSize
			}))
		end
		return reactModule.createElement(view, {
			LayoutOrder = p2,
			Size = UDim2.new(1, -32, 0, buttonSize)
		}, t)
	end
	
	return reactModule.createElement(view, {
		tag = "bg-surface-0",
		Size = UDim2.new(1, 0, 0, p1.height)
	}, reactModule.useMemo(function()
		-- upvalues: reactModule (copy), view (copy), numRows (ref), renderRow (ref), buttonsPerRow (ref)
		local t = {}
		table.insert(t, reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 16)
		}))
		table.insert(t, reactModule.createElement(view, { LayoutOrder = 0, Size = UDim2.new(1, 0, 0, 0) }))
		local var5 = 1
		
		for i = 1, numRows do
			table.insert(t, renderRow(i, var5, buttonsPerRow))
			var5 += buttonsPerRow
		end
		return t
	end, { var1 }))
end