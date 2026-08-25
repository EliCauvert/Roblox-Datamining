local editProfileBackground = script:FindFirstAncestor("EditProfileBackground")
local parent = editProfileBackground.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local profileBackgroundButtonModule = require(editProfileBackground.Components.ProfileBackgroundButton)
local constantsModule = require(editProfileBackground.Common.Constants)

return function(p0)
	-- upvalues: reactModule (ref), constantsModule (ref), profileBackgroundButtonModule (ref), view (ref)
	local var4, var5 = reactModule.useState(p0.currentBackgroundId or constantsModule.BACKGROUND_ASSET_IDS[1])
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var5 (ref)
		if p0.currentBackgroundId then
			var5(p0.currentBackgroundId)
		end
	end, { p0.currentBackgroundId })
	local BACKGROUND_ASSET_IDS = constantsModule.BACKGROUND_ASSET_IDS
	local buttonsPerRow = p0.buttonsPerRow
	local numRows = p0.numRows
	local buttonSize = p0.buttonSize
	local var6 = reactModule.useCallback(function(p1)
		-- upvalues: var5 (ref), p0 (ref)
		var5(p1)
		task.delay(0.1, function()
			-- upvalues: p0 (copy), p1 (ref)
			if p0.onBackgroundSelected then
				p0.onBackgroundSelected(p1)
			end
		end)
	end, { p0.onBackgroundSelected })
	
	local function renderRow(p2, p3, p4)
		-- upvalues: reactModule (copy), BACKGROUND_ASSET_IDS (ref), var4 (ref), profileBackgroundButtonModule (copy), var6 (ref), buttonSize (ref), view (copy), buttonSize (ref)
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
			local var9 = BACKGROUND_ASSET_IDS[i]
			table.insert(t, reactModule.createElement(profileBackgroundButtonModule, {
				LayoutOrder = i,
				profileBackgroundId = var9,
				selected = var4 == var9,
				onActivated = var6,
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
		Size = UDim2.new(1, 0, 0, p0.height)
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
		local var11 = 1
		
		for i = 1, numRows do
			table.insert(t, renderRow(i, var11, buttonsPerRow))
			var11 += buttonsPerRow
		end
		return t
	end, { var4 }))
end