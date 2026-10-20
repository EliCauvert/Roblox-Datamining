local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.Luobu.Constants)
local TModule = require(CorePackages.Packages.t)
local TencentNoticeList = RoactModule.PureComponent:extend("TencentNoticeList")
TencentNoticeList.validateProps = TModule.strictInterface({ renderItem = TModule.callback, itemList = TModule.table })

function TencentNoticeList.render(p1)
	-- upvalues: ConstantsModule (copy), WithStyleFunction (copy), RoactModule (copy)
	local RenderItemFunction = p1.props.renderItem
	local ItemList = p1.props.itemList
	local TENCENTNOTICECENTERPAGEROWHEIGHT = ConstantsModule.TENCENT_NOTICE_CENTER_PAGE_ROW_HEIGHT
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), ItemList (copy), TENCENTNOTICECENTERPAGEROWHEIGHT (copy), RenderItemFunction (copy)
		local BackgroundDefault = p2.Theme.BackgroundDefault
		local Divider = p2.Theme.Divider
		local config = {
			Layout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Right
			})
		}
		
		for i, value in ipairs(ItemList) do
			local v1 = i < #ItemList
			config["NoticeList_Row_" .. value.noticeId] = RenderItemFunction(value, {
				Size = UDim2.new(1, 0, 0, v1 and TENCENTNOTICECENTERPAGEROWHEIGHT - 1 or TENCENTNOTICECENTERPAGEROWHEIGHT),
				LayoutOrder = i * 2 - 1
			})
			config["NoticeList_Divider_" .. value.noticeId] = v1 and RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, -24, 0, 1),
				BackgroundColor3 = Divider.Color,
				BackgroundTransparency = Divider.Transparency,
				LayoutOrder = i * 2
			})
		end
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, TENCENTNOTICECENTERPAGEROWHEIGHT * #ItemList),
			BackgroundColor3 = BackgroundDefault.Color,
			BackgroundTransparency = BackgroundDefault.Transparency,
			BorderColor3 = Divider.Color
		}, config)
	end)
end

return TencentNoticeList