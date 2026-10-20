local ExpChat = script:FindFirstAncestor("ExpChat")
local Parent = ExpChat.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SignalsModule = require(Parent.Signals)
local UseSignalBindingFunction = require(Parent.SignalsReact).useSignalBinding
local GetRewriteDropdownStoreModule = require(ExpChat.Stores.GetRewriteDropdownStore)
local GetMessagesStoreModule = require(ExpChat.Stores.GetMessagesStore)
local LocalizationModule = require(ExpChat.Localization)
local FStringInExpChatRewriteReasonKeyModule = require(ExpChat.Flags.FStringInExpChatRewriteReasonKey)
local MergeBindableScalarModule = require(ExpChat.ChatWindow.Helpers.mergeBindableScalar)

return ReactModule.memo(function(p1)
	-- upvalues: FoundationModule (copy), LocalizationModule (copy), FStringInExpChatRewriteReasonKeyModule (copy), GetMessagesStoreModule (copy), GetRewriteDropdownStoreModule (copy), ReactModule (copy), SignalsModule (copy), UseSignalBindingFunction (copy), MergeBindableScalarModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseLocalizationResult = LocalizationModule.useLocalization({
		defaultRewrittenReasonLabelText = "CoreScripts.TextChat.ChatWindows.RewrittenReasonLabel",
		rewrittenReasonLabelText = FStringInExpChatRewriteReasonKeyModule
	})
	local MessagesStoreModule = GetMessagesStoreModule(false)
	local RewriteDropdownStoreModule = GetRewriteDropdownStoreModule(false)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), RewriteDropdownStoreModule (copy), MessagesStoreModule (copy)
		local Computed = SignalsModule.createComputed(function(p2)
			-- upvalues: RewriteDropdownStoreModule (upval), MessagesStoreModule (upval)
			local ComponentId = RewriteDropdownStoreModule.getComponentId(p2)
			
			if not ComponentId then
				return nil
			end
			local OpenMessageId = RewriteDropdownStoreModule.getOpenMessageId(p2)
			
			if not OpenMessageId then
				return nil
			end
			local MessageComponentSignal = MessagesStoreModule.getMessageComponentSignal(ComponentId)
			
			if not MessageComponentSignal then
				return nil
			end
			local MessageComponentSignalResult = MessageComponentSignal(p2)
			
			if MessageComponentSignalResult then
				local v1 = MessagesStoreModule.getMessage(MessageComponentSignalResult)(p2)
				
				return if v1 and MessageComponentSignalResult == OpenMessageId then v1 else nil
			else
				return nil
			end
		end)
		
		return {
			getVisible = SignalsModule.createComputed(function(p2)
				-- upvalues: Computed (copy)
				local ComputedResult = Computed(p2)
				
				return if ComputedResult then ComputedResult.wasRewritten else false
			end),
			getLayoutOrder = SignalsModule.createComputed(function(p2): number
				-- upvalues: RewriteDropdownStoreModule (upval), MessagesStoreModule (upval)
				local ComponentId = RewriteDropdownStoreModule.getComponentId(p2)
				
				if ComponentId then
					local LayoutOrderSignal = MessagesStoreModule.getLayoutOrderSignal(ComponentId)
					
					return if LayoutOrderSignal then LayoutOrderSignal(p2) + 1 else 0
				else
					return 0
				end
			end),
			getOriginalText = SignalsModule.createComputed(function(p2)
				-- upvalues: Computed (copy)
				local ComputedResult = Computed(p2)
				
				return ComputedResult and ComputedResult.originalText or ""
			end)
		}
	end, {})
	local UseSignalBindingResult = UseSignalBindingFunction(UseMemoResult.getVisible)
	local UseSignalBindingResult1 = UseSignalBindingFunction(UseMemoResult.getLayoutOrder)
	local UseSignalBindingResult2 = UseSignalBindingFunction(UseMemoResult.getOriginalText)
	local MapResult = UseSignalBindingResult2:map(function(p2): boolean
		return p2 ~= nil and p2 ~= ""
	end)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		Size = UDim2.new(1, 0, 0, 0),
		LayoutOrder = UseSignalBindingResult1,
		Visible = UseSignalBindingResult
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseTokensResult.Padding.XXSmall),
			PaddingBottom = UDim.new(0, UseTokensResult.Padding.XXSmall),
			PaddingRight = p1.arButtonPadding
		}),
		ReactModule.createElement(FoundationModule.View, {
			tag = "col align-x-left gap-xxsmall padding-small radius-medium size-full-0 auto-y",
			backgroundStyle = {
				Color3 = UseTokensResult.Color.Common.Scrim.Color3,
				Transparency = MergeBindableScalarModule(0.7, p1.textTransparency)
			}
		}, {
			OriginalText = ReactModule.createElement(FoundationModule.Text, {
				tag = "text-body-small text-align-x-left text-wrap size-full-0 auto-y",
				LayoutOrder = 1,
				RichText = true,
				Text = UseSignalBindingResult2,
				Visible = MapResult,
				textStyle = {
					Color3 = UseTokensResult.Color.Content.Muted.Color3,
					Transparency = MergeBindableScalarModule(UseTokensResult.Color.Content.Muted.Transparency, p1.textTransparency)
				},
				stroke = {
					Color = Color3.fromRGB(0, 0, 0),
					Transparency = MergeBindableScalarModule(0.5, p1.textTransparency),
					Thickness = UseTokensResult.Stroke.Thin
				}
			}),
			Divider = ReactModule.createElement(FoundationModule.Divider, {
				LayoutOrder = 2,
				orientation = FoundationModule.Enums.Orientation.Horizontal,
				Visible = ReactModule.joinBindings({ p1.textTransparency, MapResult }):map(function(Entry)
					return Entry[1] < 1 and Entry[2]
				end),
				DividerVariant = FoundationModule.Enums.DividerVariant.Default
			}),
			ReasoningText = ReactModule.createElement(FoundationModule.Text, {
				tag = "text-body-small text-align-x-left text-wrap size-full-0 auto-y",
				LayoutOrder = 3,
				RichText = true,
				Text = if UseLocalizationResult.rewrittenReasonLabelText and UseLocalizationResult.rewrittenReasonLabelText ~= "" then UseLocalizationResult.rewrittenReasonLabelText else UseLocalizationResult.defaultRewrittenReasonLabelText,
				textStyle = {
					Color3 = UseTokensResult.Color.Content.Default.Color3,
					Transparency = MergeBindableScalarModule(UseTokensResult.Color.Content.Default.Transparency, p1.textTransparency)
				},
				stroke = {
					Color = Color3.fromRGB(0, 0, 0),
					Transparency = MergeBindableScalarModule(0.5, p1.textTransparency),
					Thickness = UseTokensResult.Stroke.Thin
				}
			})
		})
	})
end)