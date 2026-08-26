local parent = script.Parent.Parent
local roactModule = require(parent.Roact)
local interactable = require(parent.UIBlox).Core.Control.Interactable
local linkingProtocol = require(parent.LinkingProtocol).LinkingProtocol
local var1 = require(parent.RobloxTranslator):FormatByKey("CoreScripts.Ads.Label.IllegalContentReportingLink")

function ReportAdFooter(p1)
	-- upvalues: linkingProtocol (ref), roactModule (ref), interactable (ref), var1 (ref)
	local default = linkingProtocol.default
	local text = "https://www.roblox.com/illegal-content-reporting?contentURL=" .. ("https://create.roblox.com/store/asset/" .. p0.assetId)
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 48)
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		UIPadding = roactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 16) }),
		Border = roactModule.createElement("Frame", {
			BackgroundTransparency = 0.8,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 1),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		}),
		InteractableText = roactModule.createElement(interactable, {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			[roactModule.Event.Activated] = function()
				-- upvalues: default (ref), text (ref)
				default:openURL(text)
			end
		}, {
			UIListLayout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			FooterText = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 16,
				TextScaled = false,
				TextWrapped = false,
				Text = var1,
				TextColor3 = Color3.fromRGB(82, 173, 244),
				Font = Enum.Font.GothamBold,
				AutomaticSize = Enum.AutomaticSize.XY,
				AnchorPoint = Vector2.new(0.5, 0.5)
			}, {
				UIPadding = roactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 16) })
			})
		})
	})
end

return ReportAdFooter