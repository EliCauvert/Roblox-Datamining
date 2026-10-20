local Jest = require(script:FindFirstAncestor("InlineRichText").Parent.Dev.JestGlobals).jest

return {
	createMockLinkingProtocol = function()
		-- upvalues: Jest (copy)
		return {
			mockIsURLRegistered = Jest.fn(),
			mockDetectURL = Jest.fn(),
			mockOpenURL = Jest.fn()
		}
	end,
	createLinkingProtocolMockImpl = function(MockLinkingProtocol)
		return function()
			-- upvalues: MockLinkingProtocol (copy)
			return {
				LinkingProtocol = {
					default = {
						isURLRegistered = function(_, p1)
							-- upvalues: MockLinkingProtocol (upval)
							return MockLinkingProtocol.mockIsURLRegistered(p1)
						end,
						detectURL = function(_, p1)
							-- upvalues: MockLinkingProtocol (upval)
							return MockLinkingProtocol.mockDetectURL(p1)
						end,
						openURL = function(_, p1)
							-- upvalues: MockLinkingProtocol (upval)
							return MockLinkingProtocol.mockOpenURL(p1)
						end
					}
				}
			}
		end
	end
}