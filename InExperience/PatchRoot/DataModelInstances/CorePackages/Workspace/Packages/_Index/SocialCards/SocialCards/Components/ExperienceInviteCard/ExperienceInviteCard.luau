local Parent = script.Parent
local Parent1 = Parent:FindFirstAncestor("SocialCards").Parent
local LocalizationModule = require(Parent1.Localization)
local ReactModule = require(Parent1.React)
local SignalsModule = require(Parent1.Signals)
local InviteCardViewModule = require(Parent.InviteCardView)
local InviteTypesModule = require(Parent.InviteTypes)
local ParseExperienceInviteModule = require(Parent.parseExperienceInvite)
local UseInviteCardViewModelModule = require(Parent.useInviteCardViewModel)
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization

local function ConnectedInviteCard(p1)
	-- upvalues: ReactModule (copy), SignalsModule (copy), UseInviteCardViewModelModule (copy), InviteCardViewModule (copy)
	local UniverseId = p1.universeId
	local ActorId = p1.actorId
	
	return ReactModule.createElement(InviteCardViewModule, (UseInviteCardViewModelModule((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), UniverseId (copy), ActorId (copy)
		return (SignalsModule.createSignal({ universeId = UniverseId, actorId = ActorId }))
	end, { UniverseId, ActorId })))))
end

local function UnavailableInviteCard()
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), InviteCardViewModule (copy), InviteTypesModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		unavailable = "Feature.Chat.Label.Unavailable",
		join = "Common.VisitGame.Label.Play"
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), UseLocalizationResult (copy)
		return {
			thumbnail = ReactModule.createBinding(""),
			title = ReactModule.createBinding(UseLocalizationResult.unavailable),
			description = ReactModule.createBinding("")
		}
	end, { UseLocalizationResult.unavailable })
	
	return ReactModule.createElement(InviteCardViewModule, {
		status = InviteTypesModule.InviteCardStatus.Unavailable,
		thumbnail = UseMemoResult.thumbnail,
		title = UseMemoResult.title,
		description = UseMemoResult.description,
		joinText = UseLocalizationResult.join
	})
end

return function(p1)
	-- upvalues: ParseExperienceInviteModule (copy), ReactModule (copy), UnavailableInviteCard (copy), ConnectedInviteCard (copy)
	local ParseExperienceInviteModuleResult = ParseExperienceInviteModule(p1)
	
	return if ParseExperienceInviteModuleResult == nil then ReactModule.createElement(UnavailableInviteCard) else ReactModule.createElement(ConnectedInviteCard, ParseExperienceInviteModuleResult)
end