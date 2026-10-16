local ExperienceStateRecordingService = game:GetService("ExperienceStateRecordingService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent = script.Parent
local ButtonAssetsModule = require(Parent.ButtonAssets)
local CreateButtonsTimeModule = require(Parent.CreateButtonsTime)

return {
	setupControl = function(p1) --[[ Line: 12 ]]
		-- upvalues: ButtonAssetsModule (copy), ExperienceStateRecordingService (copy), CreateButtonsTimeModule (copy), ReplicatedStorage (copy), UserInputService (copy)
		p1.connections = {}
		
		function p1.SetPlaying() --[[ Line: 15 ]]
			-- upvalues: p1 (copy), ButtonAssetsModule (upval), ExperienceStateRecordingService (upval)
			p1.state.Playing = true
			p1.PlayButton.Image = ButtonAssetsModule.PauseButton
			ExperienceStateRecordingService:SetPlaybackMode(Enum.ExperienceStateRecordingPlaybackMode.Playing)
		end
		
		function p1.SetPaused() --[[ Line: 22 ]]
			-- upvalues: p1 (copy), ButtonAssetsModule (upval), ExperienceStateRecordingService (upval)
			p1.state.Playing = false
			p1.PlayButton.Image = ButtonAssetsModule.PlayButton
			ExperienceStateRecordingService:SetPlaybackMode(Enum.ExperienceStateRecordingPlaybackMode.Stopped)
		end
		
		function p1.ControlButtons(PlayButton) --[[ Line: 29 ]]
			-- upvalues: p1 (copy), CreateButtonsTimeModule (upval), ReplicatedStorage (upval), ExperienceStateRecordingService (upval)
			p1.StopButton.ImageColor3 = CreateButtonsTimeModule.regularColor
			p1.StopButton:SetAttribute("useHoverColor", true)
			p1.ReverseButton.ImageColor3 = CreateButtonsTimeModule.regularColor
			p1.ReverseButton:SetAttribute("useHoverColor", true)
			p1.state.Reversing = false
			
			if PlayButton ~= p1.PlayButton then
				p1.PlayButton.ImageColor3 = CreateButtonsTimeModule.regularColor
			end
			if PlayButton == p1.PlayButton then
				if p1.state.Playing then
					p1.SetPaused()
					
					return
				else
					p1.SetPlaying()
					
					return
				end
			elseif PlayButton == p1.StopButton then
				p1.StopButton:SetAttribute("useHoverColor", false)
				p1.StopButton.ImageColor3 = CreateButtonsTimeModule.clickColor
				p1.LoadingOverlay.Visible = true
				p1.LoadingLabel.Text = "Returning To Replay Browser"
				p1.state.Loading = true
				ReplicatedStorage:WaitForChild("TeleportRequest"):FireServer()
				
				return
			else
				if PlayButton == p1.ReverseButton then
					p1.state.Reversing = true
					p1.SetPaused()
					p1.ReverseButton:SetAttribute("useHoverColor", false)
					p1.ReverseButton.ImageColor3 = CreateButtonsTimeModule.clickColor
					ExperienceStateRecordingService:SetPlaybackMode(Enum.ExperienceStateRecordingPlaybackMode.Rewinding)
				end
			end
		end
		
		p1.connections.PlayListener = p1.PlayButton.MouseButton1Click:Connect(function() --[[ Line: 64 ]]
			-- upvalues: p1 (copy)
			p1.ControlButtons(p1.PlayButton)
		end)
		p1.connections.StopListener = p1.StopButton.MouseButton1Click:Connect(function() --[[ Line: 69 ]]
			-- upvalues: p1 (copy)
			p1.ControlButtons(p1.StopButton)
		end)
		p1.connections.ReverseListener = p1.ReverseButton.MouseButton1Click:Connect(function() --[[ Line: 74 ]]
			-- upvalues: p1 (copy)
			p1.ControlButtons(p1.ReverseButton)
		end)
		UserInputService.InputBegan:Connect(function(Input, _) --[[ Line: 79 ]]
			-- upvalues: p1 (copy)
			if Input.KeyCode == Enum.KeyCode.Space then
				p1.ControlButtons(p1.PlayButton)
				
				return
			end
			if Input.KeyCode == Enum.KeyCode.R then
				p1.ControlButtons(p1.ReverseButton)
				
				return
			end
			if Input.KeyCode == Enum.KeyCode.X then
				p1.ControlButtons(p1.StopButton)
			end
		end)
	end
}