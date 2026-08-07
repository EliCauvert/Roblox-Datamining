local experienceStateRecordingService = game:GetService("ExperienceStateRecordingService")
local userInputService = game:GetService("UserInputService")
local replicatedStorageService = game:GetService("ReplicatedStorage")
local parent = script.Parent
local buttonAssetsModule = require(parent.ButtonAssets)
local createButtonsTimeModule = require(parent.CreateButtonsTime)

return {
	setupControl = function(value) --[[ line: 12 ]]
		-- upvalues: buttonAssetsModule (ref), experienceStateRecordingService (ref), createButtonsTimeModule (ref), replicatedStorageService (ref), userInputService (ref)
		value.connections = {}
		
		function value.SetPlaying() --[[ line: 15 ]]
			-- upvalues: value (ref), buttonAssetsModule (copy), experienceStateRecordingService (copy)
			value.state.Playing = true
			value.PlayButton.Image = buttonAssetsModule.PauseButton
			experienceStateRecordingService:SetPlaybackMode(Enum.ExperienceStateRecordingPlaybackMode.Playing)
		end
		
		function value.SetPaused() --[[ line: 22 ]]
			-- upvalues: value (ref), buttonAssetsModule (copy), experienceStateRecordingService (copy)
			value.state.Playing = false
			value.PlayButton.Image = buttonAssetsModule.PlayButton
			experienceStateRecordingService:SetPlaybackMode(Enum.ExperienceStateRecordingPlaybackMode.Stopped)
		end
		
		function value.ControlButtons(p0) --[[ line: 29 ]]
			-- upvalues: value (ref), createButtonsTimeModule (copy), replicatedStorageService (copy), experienceStateRecordingService (copy)
			value.StopButton.ImageColor3 = createButtonsTimeModule.regularColor
			value.StopButton:SetAttribute("useHoverColor", true)
			value.ReverseButton.ImageColor3 = createButtonsTimeModule.regularColor
			value.ReverseButton:SetAttribute("useHoverColor", true)
			value.state.Reversing = false
			
			if p0 ~= value.PlayButton then
				value.PlayButton.ImageColor3 = createButtonsTimeModule.regularColor
			end
			if p0 == value.PlayButton then
				if value.state.Playing then
					value.SetPaused()
					
					return
				end
				value.SetPlaying()
				
				return
			elseif p0 == value.StopButton then
				value.StopButton:SetAttribute("useHoverColor", false)
				value.StopButton.ImageColor3 = createButtonsTimeModule.clickColor
				value.LoadingOverlay.Visible = true
				value.LoadingLabel.Text = "Returning To Replay Browser"
				value.state.Loading = true
				replicatedStorageService:WaitForChild("TeleportRequest"):FireServer()
				
				return
			elseif p0 == value.ReverseButton then
				value.state.Reversing = true
				value.SetPaused()
				value.ReverseButton:SetAttribute("useHoverColor", false)
				value.ReverseButton.ImageColor3 = createButtonsTimeModule.clickColor
				experienceStateRecordingService:SetPlaybackMode(Enum.ExperienceStateRecordingPlaybackMode.Rewinding)
			end
		end
		
		value.connections.PlayListener = value.PlayButton.MouseButton1Click:Connect(function() --[[ line: 64 ]]
			-- upvalues: value (ref)
			value.ControlButtons(value.PlayButton)
		end)
		value.connections.StopListener = value.StopButton.MouseButton1Click:Connect(function() --[[ line: 69 ]]
			-- upvalues: value (ref)
			value.ControlButtons(value.StopButton)
		end)
		value.connections.ReverseListener = value.ReverseButton.MouseButton1Click:Connect(function() --[[ line: 74 ]]
			-- upvalues: value (ref)
			value.ControlButtons(value.ReverseButton)
		end)
		userInputService.InputBegan:Connect(function(p1, _) --[[ line: 79 ]]
			-- upvalues: value (ref)
			if p1.KeyCode == Enum.KeyCode.Space then
				value.ControlButtons(value.PlayButton)
				
				return
			elseif p1.KeyCode == Enum.KeyCode.R then
				value.ControlButtons(value.ReverseButton)
				
				return
			elseif p1.KeyCode == Enum.KeyCode.X then
				value.ControlButtons(value.StopButton)
			end
		end)
	end
}