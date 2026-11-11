local Parent = script:FindFirstAncestor("AppStartup").Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Images = UIBloxModule.App.ImageSet.Images
local LinkButton = UIBloxModule.App.Button.LinkButton
local StartupMessageActionButtonEnabledEngineFeature = game:GetEngineFeature("StartupMessageActionButtonEnabled")

return function(p1)
	-- upvalues: StartupMessageActionButtonEnabledEngineFeature (copy), ButtonType (copy), DashModule (copy), ReactModule (copy), LinkButton (copy), InteractiveAlert (copy), Images (copy)
	local LocalizedStrings = p1.localizedStrings
	local Message = p1.message
	local OverlayColor = p1.overlayColor
	local OnDismissed = p1.onDismissed
	local OnActionButtonActivated = p1.onActionButtonActivated
	local ScreenSize = p1.screenSize
	local ActionButtonText = if StartupMessageActionButtonEnabledEngineFeature then LocalizedStrings.actionButtonText else nil
	local v1 = nil
	
	if StartupMessageActionButtonEnabledEngineFeature then
		local List = {}
		
		if ActionButtonText then
			table.insert(List, {
				buttonType = ButtonType.PrimaryContextual,
				props = {
					onActivated = OnActionButtonActivated,
					text = ActionButtonText
				}
			})
		end
		if not Message.isBlocking then
			table.insert(List, {
				buttonType = if ActionButtonText then ButtonType.Secondary else ButtonType.PrimarySystem,
				props = {
					onActivated = OnDismissed,
					text = LocalizedStrings.buttonText
				}
			})
		end
		v1 = if #List > 0 then { buttons = List } else nil
	end
	local MapResult = DashModule.map(p1.localizedLinks, function(p2)
		-- upvalues: ReactModule (upval), LinkButton (upval), p1 (copy)
		return ReactModule.createElement(LinkButton, {
			text = p2.label,
			onActivated = function()
				-- upvalues: p1 (upval), p2 (copy)
				p1.onOpenUrl(p2.url, p2.label)
			end
		})
	end)
	
	return ReactModule.createElement("Frame", {
		Active = true,
		SelectionGroup = true,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundTransparency = if Message.isBlocking then 0 else OverlayColor.Transparency,
		BackgroundColor3 = OverlayColor.Color3,
		ref = p1.focusNavRef,
		SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
		SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
		SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
		SelectionBehaviorRight = Enum.SelectionBehavior.Stop
	}, {
		InteractiveAlert = ReactModule.createElement(InteractiveAlert, {
			screenSize = ScreenSize,
			title = LocalizedStrings.titleText or "",
			bodyText = LocalizedStrings.bodyText or "",
			titleIcon = Images["icons/status/error_large"],
			middleContent = function()
				-- upvalues: ReactModule (upval), DashModule (upval), MapResult (copy)
				return ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, DashModule.append({
					UIListLayout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						VerticalAlignment = Enum.VerticalAlignment.Top,
						HorizontalAlignment = Enum.HorizontalAlignment.Center
					})
				}, MapResult))
			end,
			buttonStackInfo = if StartupMessageActionButtonEnabledEngineFeature then v1 elseif Message.isBlocking then nil else {
				buttons = {
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = OnDismissed,
							text = LocalizedStrings.buttonText
						}
					}
				}
			}
		})
	})
end