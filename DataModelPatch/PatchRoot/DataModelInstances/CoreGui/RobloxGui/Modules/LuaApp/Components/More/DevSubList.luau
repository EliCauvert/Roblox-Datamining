local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local DevSubPlanStatusModule = require(Modules.LuaApp.Enum.DevSubPlanStatus)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local _Vector2 = Vector2.new(375, 104)
local DevSubListItemModule = require(Modules.LuaApp.Components.More.DevSubListItem)
local DevSubListHeaderModule = require(Modules.LuaApp.Components.More.DevSubListHeader)
local DevSubList = RoactModule.PureComponent:extend("DevSubList")

local function _(p1): boolean
	-- upvalues: DevSubPlanStatusModule (copy)
	return not p1.isAutoRenewing or p1.planStatus ~= DevSubPlanStatusModule.Open
end

function DevSubList.render(p1)
	-- upvalues: WithLocalizationModule (copy), WithStyleFunction (copy), RoactModule (copy), _Vector2 (copy), DevSubPlanStatusModule (copy), DevSubListHeaderModule (copy), DevSubListItemModule (copy), FitChildrenModule (copy)
	return WithLocalizationModule({
		inactiveSubs = "Feature.DevSubs.Label.InactiveSubscriptions",
		activeSubs = "Feature.DevSubs.Label.ActiveSubscriptions"
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), p1 (copy), RoactModule (upval), _Vector2 (upval), DevSubPlanStatusModule (upval), DevSubListHeaderModule (upval), DevSubListItemModule (upval), FitChildrenModule (upval)
		return WithStyleFunction(function(p3)
			-- upvalues: p1 (upval), RoactModule (upval), _Vector2 (upval), DevSubPlanStatusModule (upval), DevSubListHeaderModule (upval), p2 (copy), DevSubListItemModule (upval), FitChildrenModule (upval)
			local Props = p1.props
			local Game1 = Props.game
			local OnDevSubActivatedFunction = Props.onDevSubActivated
			local Elements = {
				Layout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, 0)
				}),
				Title = RoactModule.createElement("Frame", {
					LayoutOrder = 0,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 70)
				}, {
					SizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = _Vector2 }),
					Padding = RoactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 20) }),
					Layout = RoactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Horizontal,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						Padding = UDim.new(0, 10)
					}),
					Icon = RoactModule.createElement("ImageLabel", {
						LayoutOrder = 1,
						Size = UDim2.new(0, 44, 0, 44),
						BackgroundTransparency = if Game1.icon == nil then 0 else 1,
						Image = Game1.icon
					}),
					Text = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Size = UDim2.new(1, -54, 0, 40),
						Font = p3.Font.Title.Font,
						TextSize = p3.Font.BaseSize * p3.Font.Title.RelativeSize,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextColor3 = p3.Theme.TextDefault.Color,
						TextTransparency = p3.Theme.TextDefault.Transparency,
						TextTruncate = Enum.TextTruncate.AtEnd,
						Text = Game1.name
					})
				})
			}
			local List = {}
			local List1 = {}
			
			for _, devSub in pairs(Props.devSubs) do
				if devSub.status == "Active" then
					table.insert(List, devSub)
				else
					table.insert(List1, devSub)
				end
			end
			table.sort(List, function(A, B): boolean
				-- upvalues: DevSubPlanStatusModule (upval)
				local NoIsAutoRenewing: boolean = not A.isAutoRenewing or A.planStatus ~= DevSubPlanStatusModule.Open
				local NoIsAutoRenewing1: boolean = not B.isAutoRenewing or B.planStatus ~= DevSubPlanStatusModule.Open
				
				return if NoIsAutoRenewing and NoIsAutoRenewing1 then string.upper(A.name) < string.upper(B.name) else NoIsAutoRenewing
			end)
			local v1: boolean = #List > 0 and #List1 > 0
			local LayoutOrder = 1
			table.insert(Elements, v1 and RoactModule.createElement(DevSubListHeaderModule, {
				layoutOrder = LayoutOrder,
				maxSize = _Vector2,
				text = p2.activeSubs
			}))
			local NewLayoutOrder = LayoutOrder + 1
			
			local function addDevSub(p4, DevSub)
				-- upvalues: Elements (copy), RoactModule (upval), DevSubListItemModule (upval), _Vector2 (upval), NewLayoutOrder (ref), v1 (copy), OnDevSubActivatedFunction (copy)
				table.insert(Elements, RoactModule.createElement(DevSubListItemModule, {
					devSub = DevSub,
					maxSize = _Vector2,
					layoutOrder = NewLayoutOrder,
					hasFullDivider = v1 and p4 == 1,
					onActivated = function(...)
						-- upvalues: OnDevSubActivatedFunction (upval), DevSub (copy)
						OnDevSubActivatedFunction(DevSub, ...)
					end
				}))
				NewLayoutOrder += 1
			end
			
			for i, value in pairs(List) do
				addDevSub(i, value)
			end
			table.insert(Elements, v1 and RoactModule.createElement(DevSubListHeaderModule, {
				layoutOrder = NewLayoutOrder,
				maxSize = _Vector2,
				text = p2.inactiveSubs
			}))
			NewLayoutOrder += 1
			
			for i1, value1 in pairs(List1) do
				addDevSub(i1, value1)
			end
			return RoactModule.createElement(FitChildrenModule.FitFrame, {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				fitFields = { Size = FitChildrenModule.FitAxis.Height }
			}, Elements)
		end)
	end)
end

return DevSubList