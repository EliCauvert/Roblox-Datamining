local CorePackages = game:GetService("CorePackages")
local TextService = game:GetService("TextService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FitTextLabelModule = require(Modules.LuaApp.Components.FitTextLabel)
local FitFrameHorizontal = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents.FitFrameHorizontal
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local Pillv2 = UIBloxModule.App.Control.Pillv2
local Chip = require(CorePackages.Packages.Foundation).Chip
local InputValidity = require(CorePackages.Workspace.Packages.AuthCommon).Enums.InputValidity
local ControlState = UIBloxModule.Core.Control.Enum.ControlState
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local RefreshButtonModule = require(Modules.LuaApp.Components.Authentication.RefreshButton)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local SuggestionsFrame = RoactModule.PureComponent:extend("SuggestionsFrame")
local GetFFlagEnableSuggestionRefreshLoadingAnimationModule = require(Modules.LuaApp.Flags.GetFFlagEnableSuggestionRefreshLoadingAnimation)
local UseChipForUsernameSuggestions = game:DefineFastFlag("UseChipForUsernameSuggestions", false)

function SuggestionsFrame.init(p1)
	-- upvalues: CryoModule (copy)
	p1.state = {
		didGenerate = false,
		lastUsernameInput = "",
		showSuggestions = p1.props.showSuggestions or false,
		currentSuggestions = p1.props.prefilledSuggestions or {}
	}
	p1.isMounted = false
	p1.usernameSuggestionsShown = p1.props.usernameSuggestionsShown
	
	function p1.suggestUsername(p2)
		-- upvalues: p1 (copy)
		p1.props.suggest.suggestUsernames(p1.props.networking, p2, p1.props.birthday, p1.props.context):andThen(function(Result)
			-- upvalues: p1 (upval)
			if Result.shouldUpdateState then
				p1:setState({
					didGenerate = Result.didGenerate,
					currentSuggestions = Result.suggestions
				})
			end
		end)
	end
	
	function p1.refreshSuggestions(p2)
		-- upvalues: p1 (copy)
		p1.props.suggest.suggestUsernames(p1.props.networking, p2, p1.props.birthday, p1.props.context):andThen(function(Result)
			-- upvalues: p1 (upval)
			if Result.shouldUpdateState and Result.didGenerate then
				p1:setState({
					didGenerate = Result.didGenerate,
					currentSuggestions = Result.suggestions
				})
			end
		end)
	end
	
	function p1.suggestionsToString(List): string
		return table.concat(List, ",")
	end
	
	p1.shouldSuggest = p1.props.shouldSuggest
	p1.loadSuggestions = p1.props.loadSuggestions
	p1.finishSuggestions = p1.props.finishSuggestions
	p1.padding = {
		PaddingTop = UDim.new(0, 6),
		PaddingBottom = UDim.new(0, 2)
	}
	
	if p1.props.padding then
		p1.padding = CryoModule.Dictionary.join(p1.padding, p1.props.padding)
	end
end

function SuggestionsFrame.didMount(p1)
	p1.isMounted = true
end

function SuggestionsFrame.didUpdate(p1, _, _)
	-- upvalues: InputValidity (copy)
	if p1.isMounted then
		local Value = p1.props.textBoxRef:getValue()
		
		if Value.Text ~= "" and p1.props.prefilledSuggestions ~= p1.state.currentSuggestions then
			if p1.props.usernameValid == InputValidity.Invalid then
				if Value.Text ~= p1.state.lastUsernameInput and p1.shouldSuggest() then
					p1.suggestUsername(Value.Text)
				end
				p1:setState({ lastUsernameInput = Value.Text })
			else
				p1:setState({ didGenerate = false, lastUsernameInput = "" })
			end
			p1:setState({ showSuggestions = p1.state.didGenerate })
			
			if p1.state.showSuggestions and p1.usernameSuggestionsShown then
				p1.usernameSuggestionsShown(Value.Text, p1.suggestionsToString(p1.state.currentSuggestions))
			end
		end
	end
end

function pillPressed(Pressed): boolean
	-- upvalues: ControlState (copy)
	return Pressed == ControlState.Pressed or Pressed == ControlState.SelectedPressed
end

function suggestionPill(Text, p1, Callback, Callback1, Callback2, p2)
	-- upvalues: UseChipForUsernameSuggestions (copy), RoactModule (copy), Chip (copy), ControlState (copy), GetFFlagEnableSuggestionRefreshLoadingAnimationModule (copy), Focusable (copy), Pillv2 (copy)
	return if UseChipForUsernameSuggestions then RoactModule.createElement(Chip, {
		text = Text,
		onActivated = function()
			-- upvalues: Callback (copy), p1 (copy), Callback1 (copy), Text (copy), Callback2 (copy), ControlState (upval)
			if Callback then
				Callback()
			end
			local Value = p1:getValue()
			
			if Callback1 then
				Callback1(Value.Text, Text)
			end
			Value.Text = Text
			Callback2(ControlState.Pressed)
		end
	}) else RoactModule.createElement(Focusable[Pillv2], {
		text = Text,
		onStateChanged = function(_, p3)
			-- upvalues: Callback (copy), p1 (copy), Callback1 (copy), Text (copy), Callback2 (copy)
			if pillPressed(p3) then
				if Callback then
					Callback()
				end
				local Value = p1:getValue()
				
				if Callback1 then
					Callback1(Value.Text, Text)
				end
				Value.Text = Text
				Callback2(p3)
			end
		end,
		onActivated = function() end,
		isLoading = GetFFlagEnableSuggestionRefreshLoadingAnimationModule() and p2 or false,
		hasBorder = true
	})
end

function getPills(List, p1, p2, p3, p4, p5)
	local SuggestionPillResults = {}
	
	for _, value in pairs(List) do
		SuggestionPillResults[value] = suggestionPill(value, p1, p2, p3, p4, p5)
	end
	return SuggestionPillResults
end

function SuggestionsFrame.render(p6)
	-- upvalues: WithStyleFunction (copy), WithLocalizationModule (copy), TextService (copy), RoactModule (copy), FitChildrenModule (copy), FitTextLabelModule (copy), FitFrameHorizontal (copy), RefreshButtonModule (copy)
	if p6.isMounted and p6.props.textBoxRef:getValue().Text ~= p6.state.lastUsernameInput then
		p6:setState({ showSuggestions = false })
	end
	return WithStyleFunction(function(p7)
		-- upvalues: WithLocalizationModule (upval), TextService (upval), p6 (copy), RoactModule (upval), FitChildrenModule (upval), FitTextLabelModule (upval), FitFrameHorizontal (upval), RefreshButtonModule (upval)
		return WithLocalizationModule({ tryText = "Authentication.SignUp.Description.Try" })(function(p8)
			-- upvalues: p7 (copy), TextService (upval), p6 (upval), RoactModule (upval), FitChildrenModule (upval), FitTextLabelModule (upval), FitFrameHorizontal (upval), RefreshButtonModule (upval)
			local CaptionHeader = p7.Font.CaptionHeader
			local ScaledBaseSize = p7.Font.BaseSize * p7.Font.CaptionHeader.RelativeSize
			local NewX = TextService:GetTextSize(p8.tryText, ScaledBaseSize, CaptionHeader.Font, Vector2.new()).X + 12
			
			return p6.state.showSuggestions and RoactModule.createElement(FitChildrenModule.FitFrame, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 0),
				LayoutOrder = p6.props.layoutOrder,
				fitAxis = FitChildrenModule.FitAxis.Height,
				BackgroundColor3 = p7.Theme.BackgroundUIDefault.Color,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				padding = RoactModule.createElement("UIPadding", p6.padding),
				Title = RoactModule.createElement(FitTextLabelModule, {
					BackgroundTransparency = 1,
					TextWrapped = true,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = FitChildrenModule.FitAxis.Height,
					Text = p8.tryText .. ":",
					Font = CaptionHeader.Font,
					TextSize = ScaledBaseSize,
					TextColor3 = p7.Theme.TextEmphasis.Color,
					TextTransparency = p7.Theme.TextEmphasis.Transparency,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				SuggestionButtons = RoactModule.createElement(FitFrameHorizontal, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Position = UDim2.new(0, NewX, 0, -6),
					FillDirection = Enum.FillDirection.Vertical,
					contentPadding = UDim.new(0, 6),
					AutomaticSize = Enum.AutomaticSize.XY
				}, getPills(p6.state.currentSuggestions, p6.props.textBoxRef, p6.props.updatePillClicked, p6.props.usernameSuggestionClicked, p6.props.updateSuggestionControlState, p6.props.loadingSuggestions)),
				RefreshButtonFrame = p6.props.useRefreshButton and RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.XY
				}, {
					UIListLayout = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Right
					}),
					RefreshButton = RoactModule.createElement(RefreshButtonModule, {
						onRefresh = function()
							-- upvalues: p6 (upval)
							p6.props.logRefreshButtonClicked()
							p6.refreshSuggestions(p6.props.textBoxRef:getValue().Text)
						end,
						loadSuggestions = p6.loadSuggestions,
						finishSuggestions = p6.finishSuggestions
					})
				})
			})
		end)
	end)
end

return (RoactServices.connect({ networking = RoactNetworkingModule })(SuggestionsFrame))