local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local DependenciesModule = require(Squads.dependencies)
local PresenceType = DependenciesModule.RoduxPresence.Enums.PresenceType
local Roact = DependenciesModule.Roact
local RoactRodux = DependenciesModule.RoactRodux
local Rodux = DependenciesModule.Rodux
local React = DependenciesModule.React
local WithDefaultsFunction = DependenciesModule.Foundation.Utility.withDefaults
local SquadLocationEnum = require(Parent.SquadsCore.Enums).SquadLocationEnum
local SquadExternalContractProvider = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractProvider
local MakeSquadContractFunction = require(Parent.SquadsCore.SquadExternalContractProvider).makeSquadContract
local RoactNavigationModule = require(Parent.RoactNavigation)
local UniversalAppPolicy = require(Parent.UniversalAppPolicy).UniversalAppPolicy
local UserProfilesModule = require(Parent.UserProfiles)
local Constants = require(Parent.CrossExperience).Constants
local ApolloProvider = require(Parent.Dev.ApolloClient).ApolloProvider
local MockApolloClientResult = require(Parent.Dev.GraphQLServer).ApolloClientTestUtils.mockApolloClient({})

local function writeNameQuery(UserId, Alias)
	-- upvalues: UserProfilesModule (copy), MockApolloClientResult (copy)
	UserProfilesModule.Mutations.writeNamesQuery({
		userId = UserId,
		client = MockApolloClientResult,
		names = {
			alias = Alias,
			contactName = Alias,
			displayName = Alias,
			username = Alias,
			platformName = Alias
		},
		query = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
end

writeNameQuery("1111111111", "User 1 has a long name. User 1 has a long name.")
writeNameQuery("2222222222", "User2")
writeNameQuery(tostring(3333333333), "User " .. 3)
writeNameQuery(tostring(4444444444), "User " .. 4)
writeNameQuery(tostring(5555555555), "User " .. 5)
writeNameQuery(tostring(6666666666), "User " .. 6)
writeNameQuery(tostring(7777777777), "User " .. 7)
writeNameQuery(tostring(8888888888), "User " .. 8)
writeNameQuery(tostring(9999999999), "User " .. 9)
writeNameQuery(tostring(11111111110), "User " .. 10)
local config = {
	canUsePlatformChat = true,
	children = nil,
	userPresences = {
		["1111111111"] = {
			lastLocation = "Dress to impress",
			placeId = 12345,
			userPresenceType = PresenceType.InGame
		}
	}
}

return function(p1)
	-- upvalues: WithDefaultsFunction (copy), config (copy), React (copy), Rodux (copy), Constants (copy), Roact (copy), ApolloProvider (copy), MockApolloClientResult (copy), RoactNavigationModule (copy), UniversalAppPolicy (copy), RoactRodux (copy), SquadExternalContractProvider (copy), SquadLocationEnum (copy), MakeSquadContractFunction (copy)
	local WithDefaultsResult = WithDefaultsFunction(p1, config)
	
	return Roact.createElement(ApolloProvider, { client = MockApolloClientResult }, {
		navigationProvider = Roact.createElement(RoactNavigationModule.Provider, {
			value = {
				addListener = function(_) end,
				getParam = function(p2)
					return p2
				end,
				getScreenProps = function(_): number
					return 0
				end,
				navigate = function(_) end,
				pop = function() end
			}
		}, {
			policyProvider = Roact.createElement(UniversalAppPolicy.Provider, {
				policy = React.useMemo(function()
					-- upvalues: WithDefaultsResult (copy)
					return {
						function()
							-- upvalues: WithDefaultsResult (upval)
							return {
								getCanUsePlatformChat = function()
									-- upvalues: WithDefaultsResult (upval)
									return WithDefaultsResult.canUsePlatformChat
								end
							}
						end
					}
				end, { WithDefaultsResult.canUsePlatformChat })
			}, {
				storeProvider = Roact.createElement(RoactRodux.StoreProvider, {
					store = React.useMemo(function()
						-- upvalues: Rodux (upval), Constants (upval), WithDefaultsResult (copy)
						return Rodux.Store.new(function()
							-- upvalues: Constants (upval), WithDefaultsResult (upval)
							return {
								LocalUserId = "1111111111",
								ScreenSize = Vector2.new(450, 200),
								Squad = {
									CrossExperienceVoice = {
										Experience = {
											voiceChannelId = "party_12345",
											voiceSessionId = "party_12345_game",
											voiceStatus = Constants.VOICE_STATUS.VOICE_CONNECTED
										},
										Participants = {
											participants = {
												["1111111111"] = {
													userId = "1111111111",
													isMuted = false,
													isSpeaking = false
												}
											},
											activeUserIds = {}
										}
									},
									Presence = { byUserId = WithDefaultsResult.userPresences },
									Squad = {
										currentSquad = {
											squadId = "12345",
											members = { [1] = { userId = 1111111111 } },
											additionalData = { title = "Best friends for life" },
											invitees = {
												[1] = {
													userId = 2222222222,
													invitedAtTimestampMs = os.time() * 1000
												}
											}
										}
									},
									NetworkStatus = {},
									UserBlocking = { isBlockedByMe = {} }
								}
							}
						end, {}, { Rodux.thunkMiddleware })
					end, { WithDefaultsResult.userPresences })
				}, {
					squadExternalContractProvider = Roact.createElement(SquadExternalContractProvider, {
						squadLocation = SquadLocationEnum.UniversalApp,
						contract = MakeSquadContractFunction({
							useParentChannelTitleSelector = function(): string
								return "Best friends for life"
							end,
							useGetConversationFromId = function()
								return { participants = { "2222222222" } }
							end
						})
					}, WithDefaultsResult.children)
				})
			})
		})
	})
end