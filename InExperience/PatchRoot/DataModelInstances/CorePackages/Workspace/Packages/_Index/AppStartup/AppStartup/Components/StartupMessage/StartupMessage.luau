local parent = script:FindFirstAncestor("AppStartup").Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local images = UIBloxModule.App.ImageSet.Images
local linkButton = UIBloxModule.App.Button.LinkButton
local startupMessageActionButtonEnabledEngineFeature = game:GetEngineFeature("StartupMessageActionButtonEnabled")

return function(p0) --[[ line: 44 | named "StartupMessage" ]]
	-- upvalues: startupMessageActionButtonEnabledEngineFeature (ref), buttonType (ref), dashModule (ref), reactModule (ref), linkButton (ref), interactiveAlert (ref), images (ref)
	local localizedStrings = p0.localizedStrings
	local message = p0.message
	local overlayColor = p0.overlayColor
	local onDismissed = p0.onDismissed
	local onActionButtonActivated = p0.onActionButtonActivated
	local screenSize = p0.screenSize
	local var4 = if startupMessageActionButtonEnabledEngineFeature then localizedStrings.actionButtonText else nil
	local var5 = nil
	
	if startupMessageActionButtonEnabledEngineFeature then
		local t = {}
		
		if var4 then
			table.insert(t, {
				buttonType = buttonType.PrimaryContextual,
				props = { onActivated = onActionButtonActivated, text = var4 }
			})
		end
		if not message.isBlocking then
			table.insert(t, {
				buttonType = if var4 then buttonType.Secondary else buttonType.PrimarySystem,
				props = {
					onActivated = onDismissed,
					text = localizedStrings.buttonText
				}
			})
		end
		var5 = if #t > 0 then { buttons = t } else nil
	end
	local var7 = dashModule.map(p0.localizedLinks, function(p1) --[[ line: 80 ]]
		-- upvalues: reactModule (copy), linkButton (copy), p0 (ref)
		return reactModule.createElement(linkButton, {
			text = p1.label,
			onActivated = function() --[[ line: 83 ]]
				-- upvalues: p0 (copy), p1 (ref)
				p0.onOpenUrl(p1.url, p1.label)
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
		ref = p0.focusNavRef,
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
			middleContent = function() --[[ line: 107 ]]
				-- upvalues: reactModule (copy), dashModule (copy), var7 (ref)
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
				}, var7))
			end,
			buttonStackInfo = if startupMessageActionButtonEnabledEngineFeature then var5 elseif message.isBlocking then nil else {
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