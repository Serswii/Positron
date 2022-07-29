<?php

namespace app\models;

use Yii;
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
}
