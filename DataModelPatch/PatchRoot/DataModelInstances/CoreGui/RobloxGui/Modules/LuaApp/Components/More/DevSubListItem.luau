local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local _DateTime = require(CorePackages.Workspace.Packages.Time).DateTime
local RoactModule = require(CorePackages.Packages.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local DEPRECATEDImageSetLabelModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local DEPRECATEDImageSetButtonModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetButton)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local DevSubStatusModule = require(Modules.LuaApp.Enum.DevSubStatus)
local DevSubPlanStatusModule = require(Modules.LuaApp.Enum.DevSubPlanStatus)
local DevSubListItem = RoactModule.PureComponent:extend("DevSubListItem")
DevSubListItem.defaultProps = { layoutOrder = 0 }

function DevSubListItem:getRenewalText(p1, p2)
	return if p1.isAutoRenewing then p2.renewalDate else p2.expirationDate
end

function DevSubListItem.render(p1)
	-- upvalues: _DateTime (copy), WithLocalizationModule (copy), WithStyleFunction (copy), RoactModule (copy), DEPRECATEDImageSetButtonModule (copy), DevSubStatusModule (copy), DevSubPlanStatusModule (copy), DEPRECATEDImageSetLabelModule (copy), CryoModule (copy)
	local DevSub = p1.props.devSub
	local Values = _DateTime.fromIsoDate(DevSub.expirationDate):GetValues()
	local Formatted = string.format("%d/%d/%d", Values.Month, Values.Day, Values.Year)
	
	return WithLocalizationModule({
		monthlyPrice = {
			"Feature.DevSubs.UserManagement.MonthlyPrice",
			robuxAmount = DevSub.price
		},
		renewalDate = { "Feature.DevSubs.Label.RenewalDate", date = Formatted },
		expirationDate = { "Feature.DevSubs.Label.ExpirationDate", date = Formatted },
		discontinueDate = {
			"Feature.DevSubs.Label.DiscontinueDate",
			date = Formatted
		}
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), p1 (copy), RoactModule (upval), DEPRECATEDImageSetButtonModule (upval), DevSubStatusModule (upval), DevSubPlanStatusModule (upval), DEPRECATEDImageSetLabelModule (upval), CryoModule (upval)
		return WithStyleFunction(function(p3)
			-- upvalues: p1 (upval), p2 (copy), RoactModule (upval), DEPRECATEDImageSetButtonModule (upval), DevSubStatusModule (upval), DevSubPlanStatusModule (upval), DEPRECATEDImageSetLabelModule (upval), CryoModule (upval)
			local Props = p1.props
			local DevSub = Props.devSub
			local LayoutOrder = Props.layoutOrder
			local MaxSize = Props.maxSize
			local OnActivatedFunction = Props.onActivated
			local _UDim2_1 = nil
			local _UDim2 = nil
			
			if Props.hasFullDivider then
				_UDim2 = UDim2.new(1, 49, 0, 1)
				_UDim2_1 = UDim2.new(0, -24, 0, -15)
			else
				_UDim2 = UDim2.new(1, 25, 0, 1)
				_UDim2_1 = UDim2.new(0, 0, 0, -15)
			end
			local config = nil
			if DevSub.isAutoRenewing then
				config = {
					Font = p3.Font.CaptionBody.Font,
					TextSize = p3.Font.BaseSize * p3.Font.CaptionBody.RelativeSize,
					TextColor3 = p3.Theme.TextDefault.Color,
					TextTransparency = p3.Theme.TextDefault.Transparency,
					Text = p2.renewalDate
				}
			else
				config = {
					Font = p3.Font.CaptionHeader.Font,
					TextSize = p3.Font.BaseSize * p3.Font.CaptionHeader.RelativeSize,
					TextColor3 = p3.Theme.TextEmphasis.Color,
					TextTransparency = p3.Theme.TextEmphasis.Transparency,
					Text = p2.expirationDate
				}
				
				if DevSub.planStatus ~= "Open" then
					config.Text = p2.discontinueDate
				end
			end
			return RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, MaxSize.Y),
				LayoutOrder = LayoutOrder
			}, {
				SizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = MaxSize }),
				Padding = RoactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 15),
					PaddingLeft = UDim.new(0, 24),
					PaddingRight = UDim.new(0, 25)
				}),
				MoreButton = RoactModule.createElement(DEPRECATEDImageSetButtonModule, {
					Image = "LuaApp/icons/navbar_more",
					AnchorPoint = Vector2.new(1, 0),
					Size = UDim2.new(0, 26, 0, 26),
					Position = UDim2.new(1, 0, 0, 18),
					BackgroundTransparency = 1,
					Visible = DevSub.status == DevSubStatusModule.Active and DevSub.planStatus == DevSubPlanStatusModule.Open,
					[RoactModule.Event.Activated] = function(Frame: Frame)
						-- upvalues: OnActivatedFunction (copy)
						OnActivatedFunction(Frame.AbsolutePosition, Frame.AbsoluteSize)
					end
				}),
				TextFrame = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, -51, 1, 0)
				}, {
					Layout = RoactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, 4)
					}),
					Title = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(1, 0, 0, 22),
						Font = p3.Font.Header2.Font,
						TextSize = p3.Font.BaseSize * p3.Font.Header2.RelativeSize,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextColor3 = p3.Theme.TextDefault.Color,
						TextTransparency = p3.Theme.TextDefault.Transparency,
						TextTruncate = Enum.TextTruncate.AtEnd,
						Text = DevSub.name
					}),
					PriceFrame = RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Size = UDim2.new(1, 0, 0, 17)
					}, {
						Layout = RoactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, 4)
						}),
						Icon = RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
							BackgroundTransparency = 1,
							Image = "LuaApp/icons/robux-hex",
							LayoutOrder = 1,
							Size = UDim2.new(0, 17, 0, 17)
						}),
						Text = RoactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							LayoutOrder = 2,
							Size = UDim2.new(1, -21, 1, 0),
							Font = p3.Font.CaptionBody.Font,
							TextSize = p3.Font.BaseSize * p3.Font.CaptionBody.RelativeSize,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextColor3 = p3.Theme.TextDefault.Color,
							TextTransparency = p3.Theme.TextDefault.Transparency,
							TextTruncate = Enum.TextTruncate.AtEnd,
							Text = DevSub.price
						})
					}),
					RenewalDate = RoactModule.createElement("TextLabel", CryoModule.Dictionary.join(config, {
						BackgroundTransparency = 1,
						LayoutOrder = 3,
						Size = UDim2.new(1, 0, 0, 17),
						TextXAlignment = Enum.TextXAlignment.Left,
						TextTruncate = Enum.TextTruncate.AtEnd
					}))
				}),
				Divider = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundColor3 = p3.Theme.Divider.Color,
					BackgroundTransparency = p3.Theme.Divider.Transparency,
					Size = _UDim2,
					Position = _UDim2_1
				})
			})
		end)
	end)
end

return DevSubListItem