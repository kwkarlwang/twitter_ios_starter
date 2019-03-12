//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Karl Wang on 3/4/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    var favorited:Bool = false
    var tweetId:Int = -1
    var retweeted:Bool = false
    func setFavorite(isFavorited:Bool){
        favorited = isFavorited
        if(favorited){
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if (toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(isFavorited: true)
            }, failure: { (Error) in
                print("Favorite failed")
            })
        }
        else{
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(isFavorited: false)
            }, failure: { (Error) in
                print("Unfavorite failed")
            })
        }
    }
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(isRetweeted: true)
        }, failure: { (Error) in
            print("Retweet Error")
        })
    }
    func setRetweeted( isRetweeted:Bool){
        if(isRetweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }else{
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
