local EditProfileBackground = script:FindFirstAncestor("EditProfileBackground")
local Parent = EditProfileBackground.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local ProfileBackgroundButtonModule = require(EditProfileBackground.Components.ProfileBackgroundButton)
local ConstantsModule = require(EditProfileBackground.Common.Constants)

return function(p1)
	-- upvalues: ReactModule (copy), ConstantsModule (copy), ProfileBackgroundButtonModule (copy), View (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.currentBackgroundId or ConstantsModule.BACKGROUND_ASSET_IDS[1])
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy)
		if p1.currentBackgroundId then
			UseStateResult2(p1.currentBackgroundId)
		end
	end, { p1.currentBackgroundId })
	local BACKGROUNDASSETIDS = ConstantsModule.BACKGROUND_ASSET_IDS
	local ButtonsPerRow = p1.buttonsPerRow
	local NumRows = p1.numRows
	local ButtonSize = p1.buttonSize
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(p2)
		task.delay(0.1, function()
			-- upvalues: p1 (upval), p2 (copy)
			if p1.onBackgroundSelected then
				p1.onBackgroundSelected(p2)
			end
		end)
	end, { p1.onBackgroundSelected })
	
	local function renderRow(LayoutOrder, Total, ButtonsPerRow)
		-- upvalues: ReactModule (upval), BACKGROUNDASSETIDS (copy), UseStateResult (copy), ProfileBackgroundButtonModule (upval), UseResult (copy), ButtonSize (copy), View (upval), ButtonSize (copy)
		local List = {}
		table.insert(List, ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 16)
		}))
		table.insert(List, ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 0),
			PaddingRight = UDim.new(0, 0)
		}))
		
		for i = Total, Total + ButtonsPerRow - 1 do
			local BACKGROUNDASSETID = BACKGROUNDASSETIDS[i]
			table.insert(List, ReactModule.createElement(ProfileBackgroundButtonModule, {
				LayoutOrder = i,
				profileBackgroundId = BACKGROUNDASSETID,
				selected = UseStateResult == BACKGROUNDASSETID,
				onActivated = UseResult,
				buttonSize = ButtonSize
			}))
		end
		return ReactModule.createElement(View, {
			LayoutOrder = LayoutOrder,
			Size = UDim2.new(1, -32, 0, ButtonSize)
		}, List)
	end
	
	return ReactModule.createElement(View, {
		tag = "bg-surface-0",
		Size = UDim2.new(1, 0, 0, p1.height)
	}, (ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), View (upval), NumRows (copy), renderRow (copy), ButtonsPerRow (copy)
		local List = {}
		table.insert(List, ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 16)
		}))
		table.insert(List, ReactModule.createElement(View, { LayoutOrder = 0, Size = UDim2.new(1, 0, 0, 0) }))
		local Total = 1
		
		for i = 1, NumRows do
			table.insert(List, renderRow(i, Total, ButtonsPerRow))
			Total += ButtonsPerRow
		end
		return List
	end, { UseStateResult })))
end