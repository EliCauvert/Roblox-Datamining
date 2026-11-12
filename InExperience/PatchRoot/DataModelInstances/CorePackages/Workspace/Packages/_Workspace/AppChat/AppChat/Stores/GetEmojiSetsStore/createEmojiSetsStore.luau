local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local DataHydrationModule = require(Parent.DataHydration)
local HttpClientModule = require(Parent.HttpClient)
local PromiseModule = require(Parent.Promise)
local ReactionsModule = require(Parent.Reactions)
local _ = require(Parent.Signals)
local NewResult = require(AppChat.Logger):new(script.Name)
local ConstantsModule = require(script.Parent.Constants)
local _ = require(script.Parent.decodeEmojiSets)
local FetchEmojiSetsModule = require(script.Parent.Requests.fetchEmojiSets)

local function indexEmojis(EmojiSetsFallbackModule)
	-- upvalues: ReactionsModule (copy)
	local config = { reactionTypeByEmoteId = {}, emoteIdByReactionType = {} }
	
	for _, value in EmojiSetsFallbackModule do
		local ReactionTypeFromEmojiNameResult = ReactionsModule.Utils.reactionTypeFromEmojiName(value.name)
		
		if ReactionTypeFromEmojiNameResult ~= nil then
			config.reactionTypeByEmoteId[value.id] = ReactionTypeFromEmojiNameResult
			config.emoteIdByReactionType[ReactionTypeFromEmojiNameResult] = value.id
		end
	end
	return config
end

local IndexEmojisResult = indexEmojis((require(script.Parent.emojiSetsFallback)))

return function(p1)
	-- upvalues: DataHydrationModule (copy), NewResult (copy), HttpClientModule (copy), FetchEmojiSetsModule (copy), indexEmojis (copy), ConstantsModule (copy), PromiseModule (copy), IndexEmojisResult (copy)
	local P1 = p1 or {}
	local DataResolver = DataHydrationModule.createDataResolver({
		supportsMultiGet = false,
		replaceItems = true,
		cache = DataHydrationModule.createDataCache(),
		logError = function(p2)
			-- upvalues: NewResult (upval)
			NewResult:warning(`Error resolving emoji sets: {if type(p2) == "table" then `{p2.responseCode} {p2.errorMessage}` else tostring(p2)}`)
		end,
		fetchFn = function(_)
			-- upvalues: HttpClientModule (upval), FetchEmojiSetsModule (upval), P1 (copy), indexEmojis (upval), ConstantsModule (upval), PromiseModule (upval)
			return HttpClientModule.asPromise(FetchEmojiSetsModule(P1.network)):andThen(function(Result)
				-- upvalues: indexEmojis (upval), ConstantsModule (upval), PromiseModule (upval)
				local IndexEmojisResult = indexEmojis(Result)
				
				for _, value in ConstantsModule.PICKER_REACTION_ORDER do
					if IndexEmojisResult.emoteIdByReactionType[value] == nil then
						return PromiseModule.reject(`get-emoji-sets has no emote for {value} in the reaction picker list`)
					end
				end
				return IndexEmojisResult
			end)
		end
	})
	
	local function _(p3)
		-- upvalues: DataResolver (copy), IndexEmojisResult (upval)
		return DataResolver.getCachedItem("emoji-sets").data(p3) or IndexEmojisResult
	end
	
	return {
		getAndFetchEmojiSets = function()
			-- upvalues: DataResolver (copy)
			DataResolver.getAndFetchItem("emoji-sets")
		end,
		getReactionType = function(p3, p4)
			-- upvalues: DataResolver (copy), IndexEmojisResult (upval)
			return (DataResolver.getCachedItem("emoji-sets").data(p4) or IndexEmojisResult).reactionTypeByEmoteId[p3]
		end,
		getEmoteId = function(p3, p4)
			-- upvalues: DataResolver (copy), IndexEmojisResult (upval)
			return (DataResolver.getCachedItem("emoji-sets").data(p4) or IndexEmojisResult).emoteIdByReactionType[p3]
		end,
		clear = DataResolver.clear,
		dispose = DataResolver.dispose
	}
end