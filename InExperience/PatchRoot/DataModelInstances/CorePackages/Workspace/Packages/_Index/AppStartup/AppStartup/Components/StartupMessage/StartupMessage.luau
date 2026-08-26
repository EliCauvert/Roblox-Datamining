local parent = script:FindFirstAncestor("AppStartup").Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local images = UIBloxModule.App.ImageSet.Images
local linkButton = UIBloxModule.App.Button.LinkButton
local startupMessageActionButtonEnabledEngineFeature = game:GetEngineFeature("StartupMessageActionButtonEnabled")

return function(p1)
	-- upvalues: startupMessageActionButtonEnabledEngineFeature (ref), buttonType (ref), dashModule (ref), reactModule (ref), linkButton (ref), interactiveAlert (ref), images (ref)
	local localizedStrings = p1.localizedStrings
	local message = p1.message
	local overlayColor = p1.overlayColor
	local onDismissed = p1.onDismissed
	local onActionButtonActivated = p1.onActionButtonActivated
	local screenSize = p1.screenSize
	local var1 = if startupMessageActionButtonEnabledEngineFeature then localizedStrings.actionButtonText else nil
	local var2 = nil
	
	if startupMessageActionButtonEnabledEngineFeature then
		local t = {}
		
		if var1 then
			table.insert(t, {
				buttonType = buttonType.PrimaryContextual,
				props = { onActivated = onActionButtonActivated, text = var1 }
			})
		end
		if not message.isBlocking then
			table.insert(t, {
				buttonType = if var1 then buttonType.Secondary else buttonType.PrimarySystem,
				props = {
					onActivated = onDismissed,
					text = localizedStrings.buttonText
				}
			})
		end
		var2 = if #t > 0 then { buttons = t } else nil
	end
	local var3 = dashModule.map(p1.localizedLinks, function(p2)
		-- upvalues: reactModule (copy), linkButton (copy), p1 (ref)
		return reactModule.createElement(linkButton, {
			text = p2.label,
			onActivated = function()
				-- upvalues: p1 (copy), p2 (ref)
				p1.onOpenUrl(p2.url, p2.label)
			end
		})
	end)
	
	return reactModule.createElement("Frame", {
		Active = true,
		SelectionGroup = true,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundTransparency = if message.isBlocking then 0 else overlayColor.Transparency,
		BackgroundColor3 = overlayColor.Color3,
		ref = p1.focusNavRef,
		SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
		SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
		SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
		SelectionBehaviorRight = Enum.SelectionBehavior.Stop
	}, {
		InteractiveAlert = reactModule.createElement(interactiveAlert, {
			screenSize = screenSize,
			title = localizedStrings.titleText or "",
			bodyText = localizedStrings.bodyText or "",
			titleIcon = images["icons/status/error_large"],
			middleContent = function()
				-- upvalues: reactModule (copy), dashModule (copy), var3 (ref)
				return reactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, dashModule.append({
					UIListLayout = reactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Vertical,
						VerticalAlignment = Enum.VerticalAlignment.Top,
						HorizontalAlignment = Enum.HorizontalAlignment.Center
					})
				}, var3))
			end,
			buttonStackInfo = if startupMessageActionButtonEnabledEngineFeature then var2 elseif message.isBlocking then nil else {
				buttons = {
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = onDismissed,
							text = localizedStrings.buttonText
						}
					}
				}
			}
		})
	})
end