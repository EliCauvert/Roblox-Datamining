local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local RoactModule = require(Parent.Roact)
local RoactRoduxModule = require(Parent.RoactRodux)
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local WithStyleFunction = require(Parent.UIBlox).Style.withStyle
local ArgCheckModule = require(Parent.ArgCheck)
local FitChildrenModule = require(AuthCommon.Components.FitChildren)
local FitTextLabelModule = require(AuthCommon.Components.FitTextLabel)
local FormFactor = require(Parent.FormFactor).Enums.FormFactor
local TitleAndParagraph = RoactModule.PureComponent:extend("TitleAndParagraph")
local RegisterAuditContentModule = require(AuthCommon.Components.RegisterAuditContent)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFFlagEnableAuditForSinglePageSignUpFunction = SharedFlagsModule.GetFFlagEnableAuditForSinglePageSignUp
local GetFFlagEnableAuditForSsoFunction = SharedFlagsModule.GetFFlagEnableAuditForSso
TitleAndParagraph.defaultProps = {
	layoutOrder = 0,
	textXAlignment = Enum.TextXAlignment.Left,
	paragraphTextKeys = {},
	paragraphTextArgs = {}
}

function TitleAndParagraph.init(p1) --[[ Line: 35 ]]
	p1.parametersCache = {}
end

function TitleAndParagraph.getCachedParameters(p1, p2, List) --[[ Line: 40 ]]
	if type(List) ~= "table" then
		return nil
	end
	local Parameters = p1.parametersCache[p2]
	
	if Parameters then
		return Parameters
	end
	local t = {}
	
	for i, value in pairs(List) do
		if type(i) == "string" then
			t[i] = tostring(value)
		end
	end
	p1.parametersCache[p2] = t
	
	return t
end

local function _(p3): string --[[ Line: 67 ]]
	return "paragraphText" .. tostring(p3)
end

local _ = function(p3): string --[[ Line: 74 ]]
	return "paragraphTextTemplate" .. tostring(p3)
end

function TitleAndParagraph.render(p3) --[[ Line: 78 ]]
	-- upvalues: ArgCheckModule (copy), GetFFlagEnableAuditForSsoFunction (copy), GetFFlagEnableAuditForSinglePageSignUpFunction (copy), WithLocalizationFunction (copy), WithStyleFunction (copy), FormFactor (copy), RoactModule (copy), FitTextLabelModule (copy), FitChildrenModule (copy), RegisterAuditContentModule (copy)
	local FormFactor1 = p3.props.formFactor
	local LayoutOrder = p3.props.layoutOrder
	local TitleTextKey = p3.props.titleTextKey
	local ParagraphTextKeys = p3.props.paragraphTextKeys
	local Width = p3.props.width
	local TextXAlignment = p3.props.textXAlignment
	ArgCheckModule.isType(ParagraphTextKeys, "table", "TitleAndParagraph expects paragraphTextKeys to be a table.")
	local _UDim2: UDim2 = if Width then UDim2.new(0, Width, 0, 0) else UDim2.new(1, 0, 0, 0)
	local config = { titleText = TitleTextKey }
	
	for i, paragraphTextKey in ipairs(ParagraphTextKeys) do
		config["paragraphText" .. tostring(i)] = paragraphTextKey
		
		if GetFFlagEnableAuditForSsoFunction() and GetFFlagEnableAuditForSinglePageSignUpFunction() and p3.props.enableAuditContentCapture and type(paragraphTextKey) == "table" then
			config["paragraphTextTemplate" .. tostring(i)] = paragraphTextKey[1]
		end
	end
	if not GetFFlagEnableAuditForSsoFunction() and GetFFlagEnableAuditForSinglePageSignUpFunction() and p3.props.enableAuditContentCapture then
		config.verificationLinkingTextTemplate = "Authentication.SignUp.Description.VerificationLinkingText.VariableButtonName"
	end
	return WithLocalizationFunction(config)(function(p4) --[[ Line: 122 ]]
		-- upvalues: WithStyleFunction (upval), FormFactor1 (copy), FormFactor (upval), RoactModule (upval), FitTextLabelModule (upval), TextXAlignment (copy), FitChildrenModule (upval), ParagraphTextKeys (copy), GetFFlagEnableAuditForSinglePageSignUpFunction (upval), p3 (copy), RegisterAuditContentModule (upval), GetFFlagEnableAuditForSsoFunction (upval), LayoutOrder (copy), _UDim2 (ref)
		return WithStyleFunction(function(p5) --[[ Line: 123 ]]
			-- upvalues: FormFactor1 (upval), FormFactor (upval), RoactModule (upval), p4 (copy), FitTextLabelModule (upval), TextXAlignment (upval), FitChildrenModule (upval), ParagraphTextKeys (upval), GetFFlagEnableAuditForSinglePageSignUpFunction (upval), p3 (upval), RegisterAuditContentModule (upval), GetFFlagEnableAuditForSsoFunction (upval), LayoutOrder (upval), _UDim2 (upval)
			local ScaledBaseSize = p5.Font.BaseSize * p5.Font.Title.RelativeSize
			local TitleFont = p5.Font.Title.Font
			local Offset = 12
			local ScaledBaseSize1 = p5.Font.BaseSize * p5.Font.Body.RelativeSize
			local BodyFont = p5.Font.Body.Font
			
			if FormFactor1 == FormFactor.COMPACT then
				ScaledBaseSize = p5.Font.BaseSize * p5.Font.Title.RelativeMinSize
				Offset = 5
				ScaledBaseSize1 = p5.Font.BaseSize * p5.Font.Body.RelativeMinSize
			end
			local LayoutOrder1 = 0
			local Elements = {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, Offset)
				}),
				Title = p4.titleText and RoactModule.createElement(FitTextLabelModule, {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					TextWrapped = true,
					LayoutOrder = LayoutOrder1,
					TextXAlignment = TextXAlignment,
					TextYAlignment = Enum.TextYAlignment.Top,
					Text = p4.titleText,
					TextSize = ScaledBaseSize,
					Font = TitleFont,
					TextColor3 = p5.Theme.SystemPrimaryDefault.Color,
					TextTransparency = p5.Theme.SystemPrimaryDefault.Transparency,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = FitChildrenModule.FitAxis.Height
				})
			}
			
			for i, paragraphTextKey in ipairs(ParagraphTextKeys) do
				LayoutOrder1 += 1
				local Text = "paragraphText" .. tostring(i)
				local Text1 = p4[Text]
				Elements[Text] = RoactModule.createElement(FitTextLabelModule, {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					TextWrapped = true,
					LayoutOrder = LayoutOrder1,
					TextXAlignment = TextXAlignment,
					TextYAlignment = Enum.TextYAlignment.Top,
					Text = Text1,
					TextSize = ScaledBaseSize1,
					Font = BodyFont,
					TextColor3 = p5.Theme.TextDefault.Color,
					TextTransparency = p5.Theme.TextDefault.Transparency,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = FitChildrenModule.FitAxis.Height
				})
				
				if GetFFlagEnableAuditForSinglePageSignUpFunction() and p3.props.enableAuditContentCapture and RegisterAuditContentModule and Text1 then
					local Text2 = "AuditContent_" .. Text
					Elements[Text2] = RoactModule.createElement(RegisterAuditContentModule, {
						translationKey = if type(paragraphTextKey) == "table" then paragraphTextKey[1] else paragraphTextKey,
						translatedSourceString = if type(paragraphTextKey) == "table" then if GetFFlagEnableAuditForSsoFunction() then p4["paragraphTextTemplate" .. tostring(i)] else p4.verificationLinkingTextTemplate else Text1,
						parameters = p3:getCachedParameters(Text2, paragraphTextKey)
					})
				end
			end
			return RoactModule.createElement(FitChildrenModule.FitFrame, {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				LayoutOrder = LayoutOrder,
				Size = _UDim2,
				fitAxis = FitChildrenModule.FitAxis.Height
			}, Elements)
		end)
	end)
end

return (RoactRoduxModule.connect(function(p4, _) --[[ Line: 223 ]]
	return { formFactor = p4.FormFactor }
end)(TitleAndParagraph))