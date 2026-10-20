local Parent = script.Parent.Parent
local RoactModule = require(Parent.Roact)
local Interactable = require(Parent.UIBlox).Core.Control.Interactable
local LinkingProtocol = require(Parent.LinkingProtocol).LinkingProtocol
local CoreScriptsAdsLabelIllegalContentReportingLink = require(Parent.RobloxTranslator):FormatByKey("CoreScripts.Ads.Label.IllegalContentReportingLink")

function ReportAdFooter(p1)
	-- upvalues: LinkingProtocol (copy), RoactModule (copy), Interactable (copy), CoreScriptsAdsLabelIllegalContentReportingLink (copy)
	local Default = LinkingProtocol.default
	local Text = "https://www.roblox.com/illegal-content-reporting?contentURL=" .. ("https://create.roblox.com/store/asset/" .. p1.assetId)
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 48)
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		UIPadding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 16) }),
		Border = RoactModule.createElement("Frame", {
			BackgroundTransparency = 0.8,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, 1),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		}),
		InteractableText = RoactModule.createElement(Interactable, {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			[RoactModule.Event.Activated] = function()
				-- upvalues: Default (copy), Text (copy)
				Default:openURL(Text)
			end
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			FooterText = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 16,
				TextScaled = false,
				TextWrapped = false,
				Text = CoreScriptsAdsLabelIllegalContentReportingLink,
				TextColor3 = Color3.fromRGB(82, 173, 244),
				Font = Enum.Font.GothamBold,
				AutomaticSize = Enum.AutomaticSize.XY,
				AnchorPoint = Vector2.new(0.5, 0.5)
			}, {
				UIPadding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 16) })
			})
		})
	})
end

return ReportAdFooter