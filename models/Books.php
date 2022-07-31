<?php

namespace app\models;

use DateTime;
use Yii;
use yii\base\BaseObject;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;
use yii\web\UploadedFile;

/**
 * This is the model class for table "books".
 *
 * @property int $id
 * @property string|null $title
 * @property int|null $isbn
 * @property int|null $pageCount
 * @property string|null $publishedDate
 * @property string|null $thumbnailUrl
 * @property string|null $shortDescription
 * @property string|null $longDescription
 * @property string|null $status
 * @property string|null $authors
 * @property string|null $categories
 */
class Books extends ActiveRecord
{
    public $file; // атрибут для хранения загружаемой картинки статьи
    public $del_img; // атрибут для удаления уже загруженной картинки
    const STATUS_PUBLISH = "PUBLISH";

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'books';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['isbn', 'pageCount'], 'integer'],
            [['publishedDate'], 'safe'],
            [['shortDescription', 'longDescription'], 'string'],
            [['title', 'thumbnailUrl', 'status'], 'string', 'max' => 255],
            [['file'], 'file', 'extensions' => 'png, jpg'],
            [['del_img'], 'boolean'],
            [['title'], 'unique'],
            [['isbn'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'isbn' => 'Isbn',
            'pageCount' => 'Page Count',
            'publishedDate' => 'Published Date',
            'thumbnailUrl' => 'Thumbnail Url',
            'icon' => 'Картинка к статье',
            'del_img'=>'Удалить картинку?',
            'shortDescription' => 'Short Description',
            'longDescription' => 'Long Description',
            'status' => 'Status',
        ];
    }

    /**
     * Gets query for [[BookAuthors]].
     *
     * @return ActiveQuery
     */
    public function getBookAuthors()
    {
        return $this->hasMany(BookAuthor::className(), ['id_book' => 'id']);
    }

    public function getStatusDate($status) {
        if ($status === self::STATUS_PUBLISH){
            return date("Y-m-d H:i:s");
        }
        return null;
    }
    public function jsonParseUpdateDB(){
        $url = file_get_contents("https://gitlab.com/prog-positron/test-app-vacancy/-/raw/master/books.json");

        $content = json_decode($url,true);
        foreach($content as $key => $subarray) {
            $model = new Books();
            var_dump($key);
            foreach($subarray as $keys => $item){
                if(is_array($item) && count($item)){
                    var_dump($keys);
                    foreach ($item as $key_array => $value){
                        if($keys === "publishedDate"){
                            $date = new DateTime($value);
                            var_dump($key_array . "=>" . $date->format('Y-m-d H:i:s'));
                        }else{
                            var_dump($key_array. "=>" . $value);
                        }
                    }
                }else{
                    if ($keys === "categories"){
                        $item = "Новинки";
                        var_dump($keys. "=>" . $item);
                    }else{
                        var_dump($keys . "=>" . $item);
                    }
                }
            }
        }
    }
    public function checkCategoryDublicate($category): void
    {
        if (!empty($category)){
            $model_category = new Category();
            $checkCategory = Category::find()->where(['category'=>$category])->count();
            if($checkCategory === "0"){
                $model_category->category = $category;
                $model_category->save();
            }
        }
    }
    public function is_file_url_exists($url) {
        if (@file_get_contents($url, 0, NULL, 0, 1)) {
            return true;
        }
        return false;
    }
}
