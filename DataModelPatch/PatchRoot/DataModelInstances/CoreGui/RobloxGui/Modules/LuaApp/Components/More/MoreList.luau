local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local RoactModule = require(CorePackages.Packages.Roact)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local ConstantsModule = require(Modules.LuaApp.Constants)
local FFlagEnableFlyoutSidePanelModule = require(Modules.LuaApp.Flags.FFlagEnableFlyoutSidePanel)
local MoreList = RoactModule.PureComponent:extend("MoreList")
MoreList.defaultProps = { LayoutOrder = 1 }

function MoreList.render(p1)
	-- upvalues: ArgCheckModule (copy), RoactModule (copy), ConstantsModule (copy), FFlagEnableFlyoutSidePanelModule (copy), WithStyleFunction (copy)
	local LayoutOrder = p1.props.LayoutOrder
	local ItemList = p1.props.itemList
	local RenderItemFunction = p1.props.renderItem
	local RowHeight = p1.props.rowHeight
	ArgCheckModule.isType(RenderItemFunction, "function", "MoreList.props.renderItem")
	
	if not ItemList or #ItemList == 0 then return end
	local function v10(BackgroundDefault, Divider)
		-- upvalues: ItemList (copy), RoactModule (upval), RowHeight (copy), RenderItemFunction (copy), ConstantsModule (upval), FFlagEnableFlyoutSidePanelModule (upval), LayoutOrder (copy)
		local Count = 0
		local config = {
			Layout = if #ItemList[1] > 1 then RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Right
			}) else #ItemList > 1 and RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Right
			})
		}
		
		for i, value in ipairs(ItemList) do
			for i1, value1 in ipairs(value) do
				Count += 1
				local v1: boolean = i1 < #value or i < #ItemList
				config["Row" .. Count] = RenderItemFunction(value1, {
					Size = UDim2.new(1, 0, 0, v1 and RowHeight - 1 or RowHeight),
					LayoutOrder = Count * 2 - 1
				})
				
				if v1 then
					config["Divider" .. Count] = RoactModule.createElement("Frame", {
						BorderSizePixel = 0,
						Size = UDim2.new(1, -(if value1.icon then if FFlagEnableFlyoutSidePanelModule then ConstantsModule.MORE_PAGE_ROW_PADDING_LEFT else ConstantsModule.MORE_PAGE_TEXT_PADDING_WITH_ICON or ConstantsModule.MORE_PAGE_ROW_PADDING_LEFT elseif FFlagEnableFlyoutSidePanelModule then ConstantsModule.MORE_PAGE_ROW_PADDING_LEFT else ConstantsModule.MORE_PAGE_ROW_PADDING_LEFT), 0, 1),
						BackgroundColor3 = Divider.Color,
						BackgroundTransparency = Divider.Transparency,
						LayoutOrder = Count * 2
					})
				end
			end
		end
		return RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, RowHeight * Count),
			BackgroundColor3 = BackgroundDefault.Color,
			BackgroundTransparency = BackgroundDefault.Transparency,
			BorderColor3 = Divider.Color,
			LayoutOrder = LayoutOrder
		}, config)
	end
	
	return WithStyleFunction(function(p2)
		-- upvalues: v10 (copy)
		return v10(p2.Theme.BackgroundDefault, p2.Theme.Divider)
	end)
end

return MoreList